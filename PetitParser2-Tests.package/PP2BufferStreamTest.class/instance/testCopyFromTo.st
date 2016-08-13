tests - context interface
testCopyFromTo
	stream := PP2BufferStream on: (ReadStream on: 'bar').

	self assert: (stream copyFrom: 1 to: 1) = 'b'.
	self assert: (stream copyFrom: 1 to: 3) = 'bar'.
