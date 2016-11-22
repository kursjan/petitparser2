tests
testEqualsWithStack
	| anotherMemento |
	memento := PP2ContextMemento new.
	memento position: 1.
	memento propertyAt: #foo put: Stack new.

	anotherMemento := PP2ContextMemento new.
	anotherMemento position: 1.
	anotherMemento propertyAt: #foo put: Stack new.
	
	self assert: memento ~~ anotherMemento.
	self assert: memento = anotherMemento.