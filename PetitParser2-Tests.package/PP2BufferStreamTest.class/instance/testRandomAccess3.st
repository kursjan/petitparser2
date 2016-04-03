tests
testRandomAccess3
	stream := PP2BufferStream on: (ReadStream on: 'bar') bufferSize: 2. 
	
	self assert: (stream atPosition: 2) = $r.	
	self assert: (stream atPosition: 1) = $a.
	self should: [ stream atPosition: 0 ] raise: SubscriptOutOfBounds description: 'too much backtrack'.
