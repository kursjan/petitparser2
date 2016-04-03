tests
testRandomAccess
	stream := PP2BufferStream on: (ReadStream on: 'bar'). 
	
	self assert: stream next = $b.
	self assert: stream next = $a.
	self assert: stream next = $r.

	self assert: (stream atPosition: 0) = $b.
	self assert: (stream atPosition: 1) = $a.
	self assert: (stream atPosition: 2) = $r.	