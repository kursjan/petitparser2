tests
testContents
	| context |
	context := self contextOn: 'foo'.
	
	self assert: (context respondsTo: #contents).