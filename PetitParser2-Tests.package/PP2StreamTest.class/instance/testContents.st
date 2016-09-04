tests - context interface
testContents
	| stream |
	stream := self streamOn: 'bar'. 
	
	self assert: stream contents equals: 'bar'.