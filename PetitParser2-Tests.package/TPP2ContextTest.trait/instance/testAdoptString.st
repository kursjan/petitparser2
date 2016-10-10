tests
testAdoptString
	| context |
	context := self contextOn: 'foo'.
	
	self assert: context contents equals: 'foo'.
	
	context adoptString: 'bar'.
	self assert: context contents equals: 'bar'.