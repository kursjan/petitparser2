preconditions
preconditions
	^ (self checkCompositeParser2: class)
		& (RBCondition withBlock: [ self checkSource ] errorString: 'Unable to parse source code')