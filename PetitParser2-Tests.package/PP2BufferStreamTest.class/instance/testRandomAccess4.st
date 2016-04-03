tests
testRandomAccess4
	stream := PP2BufferStream on: (ReadStream on: 'foobar') bufferSize: 2. 
	
	self assert: (stream atPosition: 0) = $f.	
	self assert: (stream atPosition: 1) = $o.
	self assert: (stream atPosition: 2) = $o.	
	self assert: (stream atPosition: 3) = $b.
	self assert: (stream atPosition: 4) = $a.
	self assert: (stream atPosition: 5) = $r.
	
	self should: [(stream atPosition: 0) ] raise: Exception.
	self should: [(stream atPosition: 1) ] raise: Exception.
	self should: [(stream atPosition: 2) ] raise: Exception.
	self should: [(stream atPosition: 3) ] raise: Exception.
	self assert: (stream atPosition: 4) = $a.
	self assert: (stream atPosition: 5) = $r.
