tests - context interface
testRandomAccessTooMuchBacktrack
	| stream |
	stream := self streamOn: 'bar' bufferSize: 2. 
	
	self assert: (stream atPosition: 3) = $r.	
	self assert: (stream atPosition: 2) = $a.
	self should: [ stream atPosition: 1 ] raise: SubscriptOutOfBounds description: 'too much backtrack'.
