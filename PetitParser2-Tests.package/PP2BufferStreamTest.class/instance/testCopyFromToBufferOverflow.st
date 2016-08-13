tests - context interface
testCopyFromToBufferOverflow
	stream := PP2BufferStream on: (ReadStream on: 'bar') bufferSize:2.

	self assert: (stream copyFrom: 2 to: 3) equals: 'ar'