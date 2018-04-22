tests
testUpdateBufferChangeBefore
	key := 2. "+1"
	memento furthestPosition: 3.
	change position: 1.

	context position: memento furthestPosition.
	memento contextMemento: context remember.
	
	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key + 1) equals: memento.
	self assert: memento contextMemento position equals: 4.