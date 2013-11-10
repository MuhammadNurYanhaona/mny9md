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
    exprType = Type::intType;	
}

DoubleConstant::DoubleConstant(yyltype loc, double val) : Expr(loc) {
    value = val;
    exprType = Type::doubleType;	
}

BoolConstant::BoolConstant(yyltype loc, bool val) : Expr(loc) {
    value = val;
    exprType = Type::boolType;
}

StringConstant::StringConstant(yyltype loc, const char *val) : Expr(loc) {
    Assert(val != NULL);
    value = strdup(val);
    exprType = Type::stringType;
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

void ArithmeticExpr::checkSemantics(Scope *currentScope) {
	
	Scope *globalScope = currentScope->getClosestScopeByType(GlobalScope);
	Type *leftType = NULL;
	if (left != NULL) {
		left->checkSemantics(currentScope);
		leftType = left->getExprType();
	}
	right->checkSemantics(currentScope);
	Type *rightType = right->getExprType();

	bool err = false;
	if (left != NULL) {
		if (!leftType->isCompatibleType(currentScope, rightType)) err = true;
		else if (leftType != Type::intType && leftType != Type::doubleType 
			&& leftType != Type::errorType) err = true;
	} 
	if (rightType != Type::intType && rightType != Type::doubleType 
		&& rightType != Type::errorType) err = true; 

	if (err) { 
		if (left != NULL) ReportError::IncompatibleOperands(op, leftType, rightType);
		else ReportError::IncompatibleOperand(op, rightType);;	
	} else {
		this->exprType = rightType;
		this->typeSymbol = globalScope->lookup(rightType->getName());
	}
}

PostfixExpr::PostfixExpr(Expr *l, Operator *o)
  : Expr(Join(l->GetLocation(), o->GetLocation())) {
    Assert(l != NULL && o != NULL);
    (left=l)->SetParent(this);
    (op=o)->SetParent(this);
}

void PostfixExpr::checkSemantics(Scope *currentScope) {
	Scope *globalScope = currentScope->getClosestScopeByType(GlobalScope);
	left->checkSemantics(currentScope);
	Type *leftType = left->getExprType();
	if (leftType != Type::intType && leftType != Type::errorType) {
		ReportError::IncompatibleOperand(op, leftType);
	} else {
    		this->exprType = Type::intType;	
		this->typeSymbol = globalScope->lookup(exprType->getName());
	}
}

void RelationalExpr::checkSemantics(Scope *currentScope) {
	
	Scope *globalScope = currentScope->getClosestScopeByType(GlobalScope);
	left->checkSemantics(currentScope);
	right->checkSemantics(currentScope);
	Type *leftType = left->getExprType();
	Type *rightType = right->getExprType();

	bool err = false;
	if (!leftType->isCompatibleType(currentScope, rightType)) err = true;
	if (leftType != Type::intType && leftType != Type::doubleType 
		&& leftType != Type::errorType) err = true; 
	if (rightType != Type::intType && rightType != Type::doubleType 
		&& rightType != Type::errorType) err = true; 

	if (err) {
		ReportError::IncompatibleOperands(op, leftType, rightType);
	} else {
		this->exprType = Type::boolType;
		this->typeSymbol = globalScope->lookup(exprType->getName());
	}
}

void EqualityExpr::checkSemantics(Scope *currentScope) {

	Scope *globalScope = currentScope->getClosestScopeByType(GlobalScope);
	left->checkSemantics(currentScope);
	right->checkSemantics(currentScope);
	Type *leftType = left->getExprType();
	Type *rightType = right->getExprType();

	if (!leftType->isCompatibleType(currentScope, rightType)) {
		ReportError::IncompatibleOperands(op, leftType, rightType);
	} else {
		this->exprType = Type::boolType;
		this->typeSymbol = globalScope->lookup(exprType->getName());
	}
}

void LogicalExpr::checkSemantics(Scope *currentScope) {
	
	Scope *globalScope = currentScope->getClosestScopeByType(GlobalScope);
	right->checkSemantics(currentScope);
	Type *rightType = right->getExprType();
	
	if (left != NULL) {
		left->checkSemantics(currentScope);
		Type *leftType = left->getExprType();

		if (!Type::boolType->isCompatibleType(currentScope, leftType) 
			|| !Type::boolType->isCompatibleType(currentScope, rightType)) {
			ReportError::IncompatibleOperands(op, leftType, rightType);
		}
		// if the right is valid then allow further type-checking in upper level
		if (Type::boolType == rightType) {
			this->exprType = Type::boolType;
			this->typeSymbol = globalScope->lookup(exprType->getName());
		}
	} else if (!Type::boolType->isCompatibleType(currentScope, rightType)) {
		ReportError::IncompatibleOperand(op, rightType);
	} else {
		this->exprType = Type::boolType;
		this->typeSymbol = globalScope->lookup(exprType->getName());
	}
}

void AssignExpr::checkSemantics(Scope *currentScope) {

	left->checkSemantics(currentScope);
	right->checkSemantics(currentScope);
	typeSymbol = left->getTypeSymbol(currentScope);
	exprType = left->getExprType();

	Type *rightType = right->getExprType();
	if (!exprType->isCompatibleType(currentScope, rightType)) {
		ReportError::IncompatibleOperands(op, exprType, rightType);
	}
}

void This::checkSemantics(Scope *currentScope) {
	Scope *classScope = currentScope->getClosestScopeByType(ClassScope);
	if (classScope == NULL) {
		ReportError::ThisOutsideClassScope(this);	
	} else {
		typeSymbol = currentScope->lookup(classScope->getName());
		exprType = typeSymbol->getAstType();
	}
}


ArrayAccess::ArrayAccess(yyltype loc, Expr *b, Expr *s) : LValue(loc) {
    (base=b)->SetParent(this); 
    (subscript=s)->SetParent(this);
}

void ArrayAccess::checkSemantics(Scope *currentScope) {
	base->checkSemantics(currentScope);
	if (base->getExprType()->getVariableType() != Array) {
		ReportError::BracketsOnNonArray(base);
	} else {
		this->exprType = ((ArrayType *) (base->getExprType()))->getElementType();
		this->typeSymbol = base->getTypeSymbol(currentScope);
	}
	subscript->checkSemantics(currentScope);
	Type* subType = subscript->getExprType();
	if (subType != Type::intType && subType != Type::errorType) {
		ReportError::SubscriptNotInteger(subscript);
	}	
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
		baseType = base->getExprType();

		if (baseSymbol == NULL || baseSymbol->getType() == Error) {
			validateField = false;
		} else if (baseSymbol->getType() == Class) {
			// base is a this pointer
			fieldAccessScope = baseSymbol->getNestedScope();
		} else if (baseSymbol->getType() == Variable) {
			// base is a derived variable so retrieve and check type access 
			if (baseType->getVariableType() == Array) {
				// trying to access elements of an array as fields
				ReportError::FieldNotFoundInBase(field, baseType);
			} else {
				// retrieve the scope for the type
				Symbol *typeSymbol = currentScope->lookup(baseType->getName());
				fieldAccessScope = typeSymbol->getNestedScope();
			}
		}
	} else { fieldAccessScope = currentScope; }


	// if there is no error in the base (or there is no base) then validate this field access
	if (fieldAccessScope != NULL && validateField) {
		Symbol *symbol = fieldAccessScope->lookup(field->getName());
		if (symbol == NULL || (symbol->getType() != Variable && symbol->getType() != Error)) {
			if (baseType == NULL) {
				ReportError::IdentifierNotDeclared(field, LookingForVariable);
			} else {
				ReportError::FieldNotFoundInBase(field, baseType);
			}
			currentScope->insert_symbol(new ErrorSymbol(field->getName()));	
		} else if (symbol->getType() != Error) {
			// store the symbol and type for later expression validation
			this->typeSymbol = symbol;
			this->exprType = symbol->getAstType();
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
	Type *baseType = NULL;	

	// validate access to this function from the base
	if (base != NULL) {
		base->checkSemantics(currentScope);
		Symbol *baseSymbol = base->getTypeSymbol(currentScope);
		baseType = base->getExprType();
		if (baseSymbol == NULL || baseSymbol->getType() == Error) validateFunction = false;
		else if (baseSymbol->getType() == Class) {
			// accessing a function through the this pointer
			functionScope = baseSymbol->getNestedScope();
		} else if (baseSymbol->getType() == Variable) {
			// base is a derived variable so retrieve and check type access 
			if (baseType->getVariableType() == Array) {
				if (strcmp("length", field->getName()) == 0) {
					if (actuals->NumElements() != 0) {
						ReportError::NumArgsMismatch(field, 0, actuals->NumElements());
					}
					exprType = Type::intType;
					typeSymbol = currentScope->lookup("int");
				} else {
					ReportError::IdentifierNotDeclared(field, LookingForFunction);
				}
				validateFunction = false;
			} else {
				// retrieve the scope for the type
				Symbol *typeSymbol = currentScope->lookup(baseType->getName());
				functionScope = typeSymbol->getNestedScope();
			}	
		}
	}

	// validate parameters
	for (int i = 0; i < actuals->NumElements(); i++) {
		Expr *param = actuals->Nth(i);
		param->checkSemantics(currentScope);
	}

	bool validateParameters = true;
	FunctionSymbol *functionSymbol = NULL;

	if (validateFunction) {
		Symbol *symbol = functionScope->lookup(field->getName());
		if (symbol == NULL || (symbol->getType() != Function && symbol->getType() != Error)) {
			// function is not found
			if (baseType == NULL) {
				ReportError::IdentifierNotDeclared(field, LookingForFunction);
			} else {
				ReportError::FieldNotFoundInBase(field, baseType);
			}
			// enter an error type in the context to avoid reporting the same error again
			functionScope->insert_symbol(new ErrorSymbol(field->getName()));
		} else if (symbol->getType() != Error) {
			// match actual and formal  parameter counts
			functionSymbol = (FunctionSymbol *) symbol;
			int formalParams = functionSymbol->getParameterCount();
			int actualParams = actuals->NumElements();
			if (formalParams != actualParams) {
				validateParameters = false;
				ReportError::NumArgsMismatch(field, formalParams, actualParams);
			}
			// set the type of the call expression
			typeSymbol = functionScope->lookup(functionSymbol->getReturnType());
			exprType = functionSymbol->getAstType();	
		}
	}

	// do recursive validation of each parameter
	if (functionSymbol != NULL && validateParameters) {
		Decl *decl = functionSymbol->getDecl();
		FnDecl *fnDecl = dynamic_cast<FnDecl *>(decl);
		if (fnDecl != NULL) {
			List<VarDecl*>* formals = fnDecl->getFormals();
			for (int i = 0; i < actuals->NumElements(); i++) {
				Expr *param = actuals->Nth(i);
				VarDecl *var = formals->Nth(i);
				Type *formalType = var->getType();
				Type *actualType = param->getExprType();
				if (!formalType->isCompatibleType(currentScope, actualType)) {
					ReportError::ArgMismatch(param, i + 1, actualType, formalType);	
				}
			}
		}
	}
} 

NewExpr::NewExpr(yyltype loc, NamedType *c) : Expr(loc) { 
  Assert(c != NULL);
  (cType=c)->SetParent(this);
}

void NewExpr::checkSemantics(Scope *currentScope) {
	Scope* globalScope = currentScope->getClosestScopeByType(GlobalScope);
	Symbol* symbol = globalScope->lookup(cType->getName());
	if (symbol == NULL || symbol->getType() != Class) {
		ReportError::IdentifierNotDeclared(cType->getIdentifier(), LookingForClass);
	} else {
		this->typeSymbol = symbol;
		this->exprType = cType;
	}
}

NewArrayExpr::NewArrayExpr(yyltype loc, Expr *sz, Type *et) : Expr(loc) {
    Assert(sz != NULL && et != NULL);
    (size=sz)->SetParent(this); 
    (elemType=et)->SetParent(this);
}

void NewArrayExpr::checkSemantics(Scope *currentScope) {
    
    size->checkSemantics(currentScope);
    Type* type = size->getExprType();
    if (type != Type::intType && type != Type::errorType) {
	ReportError::NewArraySizeNotInteger(size);
    }

    Type *coreType = elemType;
    while (coreType->getVariableType() == Array) {
	coreType = ((ArrayType *) coreType)->getElementType();
    }
    Scope* globalScope = currentScope->getClosestScopeByType(GlobalScope);	
    Symbol* symbol = globalScope->lookup(coreType->getName());
    if (symbol == NULL || symbol->getType() != Class) {
	ReportError::IdentifierNotDeclared(((NamedType *) coreType)->getIdentifier(), LookingForType);
    } else {
	this->typeSymbol = symbol;
	this->exprType = new ArrayType(*location, elemType);
    }			 	
}
       
