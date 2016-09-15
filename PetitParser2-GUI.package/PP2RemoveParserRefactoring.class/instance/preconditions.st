preconditions
preconditions
	^ (self checkCompositeParser2: class) & (RBCondition hasSubclasses: class) not