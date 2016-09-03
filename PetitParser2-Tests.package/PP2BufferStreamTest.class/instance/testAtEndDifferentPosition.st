tests - context interface
testAtEndDifferentPosition
	| stream |
	stream := self streamOn: 'f'.
	stream upToPosition: 1.
	self assert: (stream atEnd: 0) not.
	self assert: (stream atEnd: 1).
	
	self assert: (stream atEnd: 2).
