preconditions
preconditions
	^ (self checkCompositeParser2: class)
		& super preconditions		
		& (RBCondition definesSelector: targetProduction asSymbol in: class) not
		& (RBCondition definesInstanceVariable: targetProduction asString in: class) not