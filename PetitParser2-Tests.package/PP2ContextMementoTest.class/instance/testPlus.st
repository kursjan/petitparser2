tests
testPlus
	| anotherMemento |
	memento := PP2ContextMemento new.
	memento position: 1.
	

	anotherMemento := memento + 1.
	
	self assert: memento ~~ anotherMemento.
	self assert: anotherMemento position equals: 2.
	self assert: memento position equals: 1.