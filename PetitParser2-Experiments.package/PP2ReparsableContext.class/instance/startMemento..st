converting
startMemento: anObject

	self assert: (anObject isKindOf: PP2ContextMemento).
	super startMemento: anObject