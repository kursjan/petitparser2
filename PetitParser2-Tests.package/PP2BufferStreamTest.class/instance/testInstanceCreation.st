tests
testInstanceCreation
	stream := PP2BufferStream on: (ReadStream on: ''). 
	self assert: (stream buffer isKindOf: String).
	self assert: (stream buffer size = stream bufferSize).
