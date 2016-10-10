tests
testUpdateBufferAfter
	key := 2.
	change position: 1.
	context position: 3.
	memento contextMemento: context remember.
	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key + 1) equals: memento.
	self assert: memento contextMemento equals: 4.