tests - context interface
testRandomAccess2
	stream := PP2BufferStream on: (ReadStream on: 'bar'). 
	
	self assert: (stream atPosition: 3) = $r.	
	self assert: (stream atPosition: 2) = $a.
	self assert: (stream atPosition: 1) = $b.
