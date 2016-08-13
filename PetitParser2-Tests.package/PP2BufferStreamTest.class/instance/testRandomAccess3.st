tests - context interface
testRandomAccess3
	stream := PP2BufferStream on: (ReadStream on: 'bar') bufferSize: 2. 
	
	self assert: (stream atPosition: 3) = $r.	
	self assert: (stream atPosition: 2) = $a.
	self should: [ stream atPosition: 1 ] raise: SubscriptOutOfBounds description: 'too much backtrack'.
