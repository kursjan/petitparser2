tests
testHash
	| anotherMemento |
	memento := PP2ContextMemento new.
	memento position: 1.
	memento propertyAt: #foo put: #bar.

	anotherMemento := PP2ContextMemento new.
	anotherMemento position: 1.
	anotherMemento propertyAt: #foo put: #bar.
	
	self assert: memento hash = anotherMemento hash.