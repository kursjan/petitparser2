transforming
setChild: newChild
	self assert: child isAdaptable.
	child setChild: newChild.