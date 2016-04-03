tests
testRandomAccess2
	stream := PP2BufferStream on: (ReadStream on: 'bar'). 
	
	self assert: (stream atPosition: 2) = $r.	
	self assert: (stream atPosition: 1) = $a.
	self assert: (stream atPosition: 0) = $b.
