tests
testUpdateBufferChangeAfter
	key := 0. "+1"
	memento furthestPosition: 1.
	change position: 3.

	context position: memento furthestPosition.
	memento contextMemento: context remember.
	
	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key) equals: memento.
	self assert: memento contextMemento position equals: 1.