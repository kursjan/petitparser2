tests - context interface
testAtEnd
	| stream |
	stream := self streamOn: ''. 
	self assert: (stream atEnd: 0).
	self assert: (stream atEnd: 1).


	stream := self streamOn: 'f'. 
	self assert: (stream atEnd: 0) not.
	self assert: (stream atEnd: 1).
	self assert: (stream atEnd: 2).