transforming
changeChild: newChild
	self assert: child isAdaptable.
	child changeChild: newChild.