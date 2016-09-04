tests - context interface
testAtPosition
	| stream |
	stream := self streamOn: 'bar'. 
	
	self assert: (stream atPosition: 1) = $b.
	self assert: (stream atPosition: 2) = $a.
	self assert: (stream atPosition: 3) = $r.