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

Location* CompoundExpr::generateCode(CodeGenerator *codegen) {
	Location *t1;
	Location *t2;
	if (left != NULL) {
		t1 = left->generateCode(codegen);
	} else {
		t1 = codegen->GenLoadConstant(0);
	}
	t2 = right->generateCode(codegen);
	return codegen->GenBinaryOp(op->getToken(), t1, t2);
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

Location* PostfixExpr::generateCode(CodeGenerator *codegen) {
	Location *t1 = left->generateCode(codegen);
	Location *one = codegen->GenLoadConstant(1);
	Location *temp;
	if (strcmp("++", op->getToken()) == 0) {
		temp = codegen->GenBinaryOp("+", t1, one);
	} else temp = codegen->GenBinaryOp("-", t1, one);
	codegen->GenAssign(t1, temp);
	return t1;	
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

Location* RelationalExpr::generateCode(CodeGenerator *codegen) {

	const char* token = op->getToken();
	Location *t1 = left->generateCode(codegen);
	Location *t2 = right->generateCode(codegen);

	if (strcmp("<", token) == 0) {
		return codegen->GenBinaryOp("<", t1, t2);
	} else if (strcmp(">", token) == 0) {
		return codegen->GenBinaryOp("<", t2, t1);
	}
	Location *one = codegen->GenLoadConstant(1);
	if (strcmp(">=" , token) == 0) {
		Location *t2Prime = codegen->GenBinaryOp("-", t2, one);
		return codegen->GenBinaryOp("<", t2Prime, t1);
	} else {
		Location *t1Prime = codegen->GenBinaryOp("-", t1, one);
		return codegen->GenBinaryOp("<", t1Prime, t2);
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

Location* EqualityExpr::generateCode(CodeGenerator *codegen) {
	Location *equalityCheck;
	Location *t1 = left->generateCode(codegen);
	Location *t2 = right->generateCode(codegen);
	if (Type::stringType == left->getExprType()) {
		equalityCheck = codegen->GenBuiltInCall(StringEqual, t1, t2);
	} else {
		equalityCheck = codegen->GenBinaryOp("==", t1, t2);
	}
	if (strcmp("!=", op->getToken()) == 0) {
		Location *zero = codegen->GenLoadConstant(0);
		return codegen->GenBinaryOp("==", equalityCheck, zero);
	} else return equalityCheck;	
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

Location* LogicalExpr::generateCode(CodeGenerator *codegen) {
	if (strcmp("!", op->getToken()) != 0) {
		return CompoundExpr::generateCode(codegen);
	}
	Location *t1 = right->generateCode(codegen);
	Location *zero = codegen->GenLoadConstant(0);
	return codegen->GenBinaryOp("==", t1, zero);
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

Location* AssignExpr::generateCode(CodeGenerator *codegen) {

	Location *t1;
	Location *t2 = right->generateCode(codegen);
	ArrayAccess *arrayAccess = dynamic_cast<ArrayAccess*>(left);
	FieldAccess *fieldAccess = dynamic_cast<FieldAccess*>(left);
	if (arrayAccess != NULL) {
		t1 = arrayAccess->generateAddress(codegen);
		codegen->GenStore(t1, t2);
	} else if (fieldAccess != NULL) {
		t1 = fieldAccess->generateAddress(codegen);
		if (fieldAccess->isClassMember()) {
			codegen->GenStore(t1, t2);
		} else {
			codegen->GenAssign(t1, t2);
		}
	} else { 
		t1 = left->generateCode(codegen);
		codegen->GenAssign(t1, t2);
	}
	return t1;
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

Location* ArrayAccess::generateAddress(CodeGenerator *codegen) {

	// get address and size information
	Location *beginning = base->generateCode(codegen);
	Location *index = subscript->generateCode(codegen);
	Location *size = codegen->GenLoad(beginning);

	// check if index is out of bound
	Location *zero = codegen->GenLoadConstant(0);
	Location *testLowerLimit = codegen->GenBinaryOp("<", index, zero);
	Location *one = codegen->GenLoadConstant(1);
	Location *lastIndex = codegen->GenBinaryOp("-", size, one);
	Location *testUpperLimit = codegen->GenBinaryOp("<", lastIndex, index);
	Location *bothConditions = codegen->GenBinaryOp("||", testLowerLimit, testUpperLimit);
	int indexCheckLabelNo = globalStack->getNextLabelNum();
	char indexCheckLabel[30];
	sprintf(indexCheckLabel, "arrayAcc_%d", indexCheckLabelNo);
	codegen->GenIfZ(bothConditions, indexCheckLabel);

	// if out-of-bound index then throw a runtime error
	Location *errorMessage = codegen->GenLoadConstant(err_arr_out_of_bounds);
	codegen->GenBuiltInCall(PrintString, errorMessage);
	codegen->GenBuiltInCall(Halt);

	// generate the actual memory address
	codegen->GenLabel(indexCheckLabel);
	Location *four = codegen->GenLoadConstant(4);
	Location *wordIndex = codegen->GenBinaryOp("*", index, four);
	Location *unshiftedAddr = codegen->GenBinaryOp("+", beginning, wordIndex);
	
	// shift by 4 byte to account for the length information
	return codegen->GenBinaryOp("+", unshiftedAddr, four);
}

Location* ArrayAccess::generateCode(CodeGenerator *codegen) {
	Location *address = this->generateAddress(codegen);
	return codegen->GenLoad(address);
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
			if (baseType != NULL) {
				Scope *closestClass = currentScope->getClosestScopeByType(ClassScope);
				if (closestClass == NULL || !closestClass->isCompatibleClassScope(fieldAccessScope)) {
					ReportError::InaccessibleField(field, baseType);
				}
			}
		}
	}
}

Location* FieldAccess::generateAddress(CodeGenerator *codegen) {
	this->classMember = false;
	if (base == NULL) {
		Location* fieldLocation = currentLocalStack->getLocation(field->getName());
		if (fieldLocation == NULL) {
			VarIndexMap *map = currentLocalStack->getVariableIndex(field->getName());
			if (map != NULL) {
				this->classMember = true;
				Location *thisPtr = currentLocalStack->getLocation("this");
				Location *propIndex = codegen->GenLoadConstant(map->index);
				return codegen->GenBinaryOp("+", thisPtr, propIndex); 
			}
		}	
	} else {
		this->classMember = true;
		Location *baseLocation = base->generateCode(codegen); 	
		VarIndexMap *map = currentLocalStack->getVariableIndex(field->getName());
		Location *propIndex = codegen->GenLoadConstant(map->index);
		return codegen->GenBinaryOp("+", baseLocation, propIndex); 
	}
	return generateCode(codegen);
}


Location* FieldAccess::generateCode(CodeGenerator *codegen) {
	if (base == NULL) {
		Location* fieldLocation = currentLocalStack->getLocation(field->getName());
		if (fieldLocation == NULL) {
			VarIndexMap *map = currentLocalStack->getVariableIndex(field->getName());
			if (map != NULL) {
				Location *thisPtr = currentLocalStack->getLocation("this");
				fieldLocation = codegen->GenLoad(thisPtr, map->index); 
			}
		}	
		if (fieldLocation == NULL) {
			fieldLocation = globalStack->getLocation(field->getName());
		}
		return fieldLocation;
	} else {
		Location *baseLocation = base->generateCode(codegen); 	
		VarIndexMap *map = currentLocalStack->getVariableIndex(field->getName());
		return codegen->GenLoad(baseLocation, map->index); 
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

Location* Call::generateCode(CodeGenerator *codegen) {

	bool returnRequired = true;
	if (Type::voidType == this->getExprType()) {
		returnRequired = false;	
	}
	
	char functionLabel[30];
	bool globalFunction = false;
	Location *baseLocation = NULL;
	Location *dynamicFunctionLoc = NULL;
	Location *returnLoc = NULL;
	List<Location*> *paramLocations = new List<Location*>;

	if (base != NULL) {
		baseLocation = base->generateCode(codegen);
	}
	for (int i = 0; i < actuals->NumElements(); i++) {
		Expr *param = actuals->Nth(i);
		Location *loc = param->generateCode(codegen);
		paramLocations->Append(loc);
	}

	if (base != NULL) {
		Type *baseType = base->getExprType();
		if (baseType->getVariableType() == Array) {
			return codegen->GenLoad(baseLocation);
		} else {
			Location *vTable = codegen->GenLoad(baseLocation);
			ClassDecl *baseClass = ClassDecl::classDeclList->Lookup(baseType->getName());
			int indexOfFunction = baseClass->getFunctionIndex(field->getName());
			dynamicFunctionLoc = codegen->GenLoad(vTable, indexOfFunction * 4); 	
		}
	} else if (currentLocalStack->getCurrentClass() != NULL) {
		ClassDecl *classDecl = ClassDecl::classDeclList->Lookup(currentLocalStack->getCurrentClass());
		if (classDecl->isMemberFunction(field->getName())) {
			Location *vTable = codegen->GenLoad(CodeGenerator::ThisPtr);
			int indexOfFunction = classDecl->getFunctionIndex(field->getName());
			dynamicFunctionLoc = codegen->GenLoad(vTable, indexOfFunction * 4);
			baseLocation = CodeGenerator::ThisPtr; 	
		} else {
			sprintf(functionLabel, "_%s", field->getName());
			globalFunction = true;
		}
	} else {
		sprintf(functionLabel, "_%s", field->getName());
		globalFunction = true;
	}
	
	int pushParamCount = 0;	
	for (int i = paramLocations->NumElements() - 1; i >= 0; i--) {
		codegen->GenPushParam(paramLocations->Nth(i));
		pushParamCount++;
	} 
	if (baseLocation != NULL) {
		codegen->GenPushParam(baseLocation);
		pushParamCount++;
	}

	if (globalFunction) {
		returnLoc = codegen->GenLCall(functionLabel, returnRequired);
	} else {
		returnLoc = codegen->GenACall(dynamicFunctionLoc, returnRequired);
	}
	codegen->GenPopParams(pushParamCount * 4);
	return returnLoc;
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

Location* NewExpr::generateCode(CodeGenerator *codegen) {
	ClassDecl *classDecl = ClassDecl::classDeclList->Lookup(cType->getName());
	int objectSize = classDecl->getSize();
	Location *sizeParam = codegen->GenLoadConstant(objectSize);
	Location *rowStorage = codegen->GenBuiltInCall(Alloc, sizeParam);
	Location *vtable = codegen->GenLoadLabel(classDecl->getName());
	codegen->GenStore(rowStorage, vtable);
	return rowStorage;
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

Location* NewArrayExpr::generateCode(CodeGenerator *codegen) {
	
	// compute size
	Location *count = size->generateCode(codegen);

	// check if size is positive or not
	Location *one = codegen->GenLoadConstant(1);
	int nonHaltLabelNo = globalStack->getNextLabelNum();
	char nonHaltLabel[30];
	sprintf(nonHaltLabel, "allocate_%d", nonHaltLabelNo);
	Location *sizeCheck = codegen->GenBinaryOp("<", count, one);
	codegen->GenIfZ(sizeCheck, nonHaltLabel);

	// if non-positive then throw a runtime error
	Location *errorMessage = codegen->GenLoadConstant(err_arr_bad_size);
	codegen->GenBuiltInCall(PrintString, errorMessage);
	codegen->GenBuiltInCall(Halt);
	
	// allocate array
	codegen->GenLabel(nonHaltLabel);
	Location *elementSize = codegen->GenLoadConstant(4);
	Location *totalSize = codegen->GenBinaryOp("*", count, elementSize);
	Location *sizeWithLengthInfo = codegen->GenBinaryOp("+", totalSize, elementSize); 
	Location *array = codegen->GenBuiltInCall(Alloc, sizeWithLengthInfo);
	codegen->GenStore(array, count);
	return array;
}
       
