tests
testContentsAfterRead
	| stream |
	stream := self streamOn: 'bar'. 
	stream upToPosition: 3.	
	self assert: (stream contents) equals: 'bar'.