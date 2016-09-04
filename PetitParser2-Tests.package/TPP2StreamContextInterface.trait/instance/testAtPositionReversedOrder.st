tests - context interface
testAtPositionReversedOrder
	| stream |
	stream := self streamOn: 'bar'. 
	
	self assert: (stream atPosition: 3) = $r.
	self assert: (stream atPosition: 2) = $a.
	self assert: (stream atPosition: 1) = $b.