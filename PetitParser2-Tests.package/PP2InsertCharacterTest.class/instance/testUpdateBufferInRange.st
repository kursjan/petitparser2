tests
testUpdateBufferInRange
	key := 1.
	change position: 2.
	context position: 3.
	memento contextMemento: context remember.
	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key) isKindOf: PP2MementoPromise.
	self assert: (newBuffer at: key) buffer equals: newBuffer.
	self assert: (newBuffer at: key) limit equals: 4.
	