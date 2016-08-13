tests - context interface
testRandomAccess5
	stream := PP2BufferStream on: (ReadStream on: 'bar'). 
	
	self assert: stream next = $b.
	self assert: stream next = $a.
	self assert: stream next = $r.