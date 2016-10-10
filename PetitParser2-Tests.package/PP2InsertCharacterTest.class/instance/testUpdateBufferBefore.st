tests
testUpdateBufferBefore
	key := 1.
	change position: 3.
	context position: 2.
	memento contextMemento: context remember.
	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key) equals: memento.