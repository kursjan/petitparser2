tests - context interface
testRandomAccessTwoPasses
	| stream |
	stream := self streamOn: 'foobar' bufferSize: 2. 
	
	self assert: (stream atPosition: 1) = $f.	
	self assert: (stream atPosition: 2) = $o.
	self assert: (stream atPosition: 3) = $o.	
	self assert: (stream atPosition: 4) = $b.
	self assert: (stream atPosition: 5) = $a.
	self assert: (stream atPosition: 6) = $r.
	
	self should: [(stream atPosition: 1) ] raise: Exception.
	self should: [(stream atPosition: 2) ] raise: Exception.
	self should: [(stream atPosition: 3) ] raise: Exception.
	self should: [(stream atPosition: 4) ] raise: Exception.
	self assert: (stream atPosition: 5) = $a.
	self assert: (stream atPosition: 6) = $r.
