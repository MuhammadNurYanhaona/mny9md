/* File: ast.cc
 * ------------
 */

#include "ast.h"
#include "ast_type.h"
#include "ast_decl.h"
#include <string.h> // strdup
#include <stdio.h>  // printf
#include "tac.h"
#include "hashtable.h"
#include "codegen.h"

StackFrame* Node::globalStack = new StackFrame(false);
StackFrame* Node::currentLocalStack = NULL;

Location* StackFrame::createLocalVar(const char *name) {
	Location *location = NULL;
	if (this->localStack) {
		int offset = CodeGenerator::OffsetToFirstLocal - variableCount * CodeGenerator::VarSize; 
		location = new Location(fpRelative, offset, name);
	} else {
		int offset = CodeGenerator::OffsetToFirstGlobal + variableCount * CodeGenerator::VarSize;
		location = new Location(gpRelative, offset, name);
	}
	variableCount++;
	items->Enter(name, location, false);
	return location;
}

Location* StackFrame::createTemp() {
	char temp[10];
	sprintf(temp, "_tmp%d", variableCount);
	int offset = CodeGenerator::OffsetToFirstLocal - variableCount * CodeGenerator::VarSize; 
	Location *location = new Location(fpRelative, offset, temp);
	items->Enter(temp, location, false);
	variableCount++;
	return location;
}

Location* StackFrame::createParameter(const char *name) {
	int offset = CodeGenerator::OffsetToFirstParam + parameterCount * CodeGenerator::VarSize;
	Location *location = new Location(fpRelative, offset, name);
	items->Enter(name, location, false);
	parameterCount++;
	return location;	
}

Location* StackFrame::insertThisPointer() {
	items->Enter("this", CodeGenerator::ThisPtr, false);
	parameterCount++;
	return CodeGenerator::ThisPtr;	
}

void StackFrame::printVariables() {
	Location *location;
	Iterator<Location*> stackIterator = items->GetIterator();
	while ((location = stackIterator.GetNextValue()) != NULL) {
		printf("%s is at %s %d\n", location->GetName(), 
			(location->GetSegment() == gpRelative) ? "gp" : "fp",
			location->GetOffset());
	}	
}

Node::Node(yyltype loc) {
    location = new yyltype(loc);
    parent = NULL;
}

Node::Node() {
    location = NULL;
    parent = NULL;
}
	 
Identifier::Identifier(yyltype loc, const char *n) : Node(loc) {
    name = strdup(n);
} 

