tests
testMinus
	| anotherMemento |
	memento := PP2ContextMemento new.
	memento position: 1.
	

	anotherMemento := memento - 1.
	
	self assert: memento ~~ anotherMemento.
	self assert: anotherMemento position equals: 0.
	self assert: memento position equals: 1.