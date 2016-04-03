tests
testCopyFromToSmallBuffer
	stream := PP2BufferStream on: (ReadStream on: 'foobar') bufferSize: 3. 

	self assert: (stream copyFrom: 0 to: 2) = 'foo'.
	self assert: (stream copyFrom: 1 to: 3) = 'oob'.

	self should: [ stream copyFrom: 0 to: 2 ] raise: Exception description: 'too much backtrack'.
	self should: [ stream copyFrom: 1 to: 4 ] raise: Exception description: 'range too big'.
