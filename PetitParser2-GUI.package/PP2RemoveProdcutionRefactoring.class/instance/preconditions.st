preconditions
preconditions
	^ (self checkCompositeParser2: class)
		& (RBCondition definesSelector: production asSymbol in: class)
		& (RBCondition definesInstanceVariable: production asString in: class)