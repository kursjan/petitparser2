tests - context interface
testNewToken
	stream := PP2BufferStream on: (ReadStream on: 'foo'). 
	
	self assert: (stream newToken: PP2Token from: 1 to: 3) value equals: 'foo'.