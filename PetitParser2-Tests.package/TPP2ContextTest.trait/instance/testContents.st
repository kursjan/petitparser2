tests
testContents
	| context |
	context := self contextOn: 'foo'.
	
	self assert: (context respondsTo: #contents).
	self assert: context contents equals: 'foo'