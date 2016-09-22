tests
testParser
	| context |
	context := (self contextOn: 'bar')
		parser: #root;
		yourself.
	
	self assert: context parser equals: #root.