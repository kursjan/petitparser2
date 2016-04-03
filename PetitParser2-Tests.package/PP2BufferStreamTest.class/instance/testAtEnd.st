tests
testAtEnd
	stream := PP2BufferStream on: (ReadStream on: ''). 
	self assert: (stream atEnd: 0).
	self assert: (stream atEnd: 1).


	stream := PP2BufferStream on: (ReadStream on: 'f'). 
	self assert: (stream atEnd: 0) not.
	self assert: (stream atEnd: 1).
	stream next.
	self assert: (stream atEnd: 0) not.
	self assert: (stream atEnd: 1).
	
	self assert: (stream atEnd: 2).
