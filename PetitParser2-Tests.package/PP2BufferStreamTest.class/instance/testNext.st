tests
testNext
	stream := PP2BufferStream on: (ReadStream on: 'foo'). 
	
	self assert: stream next = $f.
	self assert: stream next = $o.
	self assert: stream next = $o.
	self assert: stream next = nil.