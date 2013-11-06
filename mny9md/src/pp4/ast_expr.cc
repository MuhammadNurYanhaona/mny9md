/* File: ast_expr.cc
 * -----------------
 * Implementation of expression node classes.
 */
#include "ast_expr.h"
#include "ast_type.h"
#include "ast_decl.h"
#include <string.h>
#include "errors.h"
#include "ast.h"
#include "scope.h"


IntConstant::IntConstant(yyltype loc, int val) : Expr(loc) {
    value = val;
}

DoubleConstant::DoubleConstant(yyltype loc, double val) : Expr(loc) {
    value = val;
}

BoolConstant::BoolConstant(yyltype loc, bool val) : Expr(loc) {
    value = val;
}

StringConstant::StringConstant(yyltype loc, const char *val) : Expr(loc) {
    Assert(val != NULL);
    value = strdup(val);
}

Operator::Operator(yyltype loc, const char *tok) : Node(loc) {
    Assert(tok != NULL);
    strncpy(tokenString, tok, sizeof(tokenString));
}
CompoundExpr::CompoundExpr(Expr *l, Operator *o, Expr *r) 
  : Expr(Join(l->GetLocation(), r->GetLocation())) {
    Assert(l != NULL && o != NULL && r != NULL);
    (op=o)->SetParent(this);
    (left=l)->SetParent(this); 
    (right=r)->SetParent(this);
}

CompoundExpr::CompoundExpr(Operator *o, Expr *r) 
  : Expr(Join(o->GetLocation(), r->GetLocation())) {
    Assert(o != NULL && r != NULL);
    left = NULL; 
    (op=o)->SetParent(this);
    (right=r)->SetParent(this);
}

PostfixExpr::PostfixExpr(Expr *l, Operator *o)
  : Expr(Join(l->GetLocation(), o->GetLocation())) {
    Assert(l != NULL && o != NULL);
    (left=l)->SetParent(this);
    (op=o)->SetParent(this);
}

void This::checkSemantics(Scope *currentScope) {
	Scope *classScope = currentScope->getClosestScopeByType(ClassScope);
	if (classScope == NULL) {
		ReportError::ThisOutsideClassScope(this);	
	} else {
		typeSymbol = currentScope->lookup(classScope->getName());
	}
}


ArrayAccess::ArrayAccess(yyltype loc, Expr *b, Expr *s) : LValue(loc) {
    (base=b)->SetParent(this); 
    (subscript=s)->SetParent(this);
}
     
FieldAccess::FieldAccess(Expr *b, Identifier *f) 
  : LValue(b? Join(b->GetLocation(), f->GetLocation()) : *f->GetLocation()) {
    Assert(f != NULL); // b can be be NULL (just means no explicit base)
    base = b; 
    if (base) base->SetParent(this); 
    (field=f)->SetParent(this);
}

void FieldAccess::checkSemantics(Scope *currentScope) {

	Scope *fieldAccessScope = NULL;
	bool validateField = true;
	Type *baseType = NULL;

	// validate base if exists
	if (base != NULL) {
		base->checkSemantics(currentScope);
		Symbol *baseSymbol = base->getTypeSymbol(currentScope);

		if (baseSymbol == NULL || baseSymbol->getType() == Error) {
			validateField = false;
		} else if (baseSymbol->getType() == Class) {
			// base is a this pointer
			fieldAccessScope = baseSymbol->getNestedScope();
			baseType = new NamedType(baseSymbol->getDecl()->getIdentifier());
		} else if (baseSymbol->getType() == Variable) {
			// base is a derived variable so retrieve and check type access 
			VariableSymbol *vs = (VariableSymbol *) (baseSymbol);
			baseType = vs->getDeclType();
			if (baseType->getVariableType() == Array) {
				// trying to access elements of an array as fields
				ReportError::InaccessibleField(field, baseType);
			} else {
				// retrieve the scope for the type
				Symbol *typeSymbol = currentScope->lookup(baseType->getName());
				fieldAccessScope = currentScope->lookup(typeSymbol->getName())->getNestedScope();
			}
		}
	} else { fieldAccessScope = currentScope; }


	// if there is no error in the base (or there is no base) then validate this field access
	if (fieldAccessScope != NULL && validateField) {
		Symbol *symbol = fieldAccessScope->lookup(field->getName());
		if (symbol == NULL) {
			if (baseType == NULL) {
				ReportError::IdentifierNotDeclared(field, LookingForVariable);
			} else {
				ReportError::FieldNotFoundInBase(field, baseType);
			}
			currentScope->insert_symbol(new ErrorSymbol(field->getName()));	
		} else {
			this->typeSymbol = symbol;
			// check if access to the field is possible from the base
			if (baseType != NULL && 
				fieldAccessScope != currentScope->getClosestScopeByType(ClassScope)) {
				ReportError::InaccessibleField(field, baseType);
			}
		}
	}
}

Call::Call(yyltype loc, Expr *b, Identifier *f, List<Expr*> *a) : Expr(loc)  {
    Assert(f != NULL && a != NULL); // b can be be NULL (just means no explicit base)
    base = b;
    if (base) base->SetParent(this);
    (field=f)->SetParent(this);
    (actuals=a)->SetParentAll(this);
}

void Call::checkSemantics(Scope *currentScope) {
	
	bool validateFunction = true;
	Scope *functionScope = currentScope;
	
	// validate access to this function from the base
	if (base != NULL) {
		base->checkSemantics(currentScope);
		Symbol *baseSymbol = base->getTypeSymbol(currentScope);
		if (baseSymbol == NULL || baseSymbol->getType() == Error) validateFunction = false;
		else if (baseSymbol->getType() == Class) {
			// accessing a function through the this pointer
			functionScope = baseSymbol->getNestedScope();
		} else if (baseSymbol->getType() == Variable) {
			// base is a derived variable so retrieve and check type access 
			VariableSymbol *vs = (VariableSymbol *) (baseSymbol);
			Type* baseType = vs->getDeclType();
			if (baseType->getVariableType() == Array) {
				// trying to access elements of an array as fields
				ReportError::InaccessibleField(field, baseType);
				validateFunction = false;
			} else {
				// retrieve the scope for the type
				Symbol *typeSymbol = currentScope->lookup(baseType->getName());
				functionScope = currentScope->lookup(typeSymbol->getName())->getNestedScope();
			}	
		}
	}

	if (validateFunction) {
		Symbol *symbol = functionScope->lookup(field->getName());
		if (symbol == NULL) {
			// function is not found
			ReportError::IdentifierNotDeclared(field, LookingForFunction);
			// enter an error type in the context to avoid reporting the same error again
			functionScope->insert_symbol(new ErrorSymbol(field->getName()));
		} else if (symbol->getType() != Error) {
			// match actual and formal  parameter counts
			FunctionSymbol *functionSymbol = (FunctionSymbol *) symbol;
			int formalParams = functionSymbol->getParameterCount();
			int actualParams = actuals->NumElements();
			if (formalParams != actualParams) {
				ReportError::NumArgsMismatch(field, formalParams, actualParams);
			}
			// set the type of the call expression
			typeSymbol = functionScope->lookup(functionSymbol->getReturnType());	
		}
	}
	// do recursive validation of each parameter
	List<Symbol*> *actualTypes = new List<Symbol*>;
	for (int i = 0; i < actuals->NumElements(); i++) {
		Expr *param = actuals->Nth(i);
		param->checkSemantics(currentScope);
		actualTypes->Append(param->getTypeSymbol(currentScope));	
	}
} 

NewExpr::NewExpr(yyltype loc, NamedType *c) : Expr(loc) { 
  Assert(c != NULL);
  (cType=c)->SetParent(this);
}


NewArrayExpr::NewArrayExpr(yyltype loc, Expr *sz, Type *et) : Expr(loc) {
    Assert(sz != NULL && et != NULL);
    (size=sz)->SetParent(this); 
    (elemType=et)->SetParent(this);
}

       
