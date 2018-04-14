tests
testPeek
	| context |
	context := self contextOn: 'foo'.
	self assert: context peek equals: $f.
	
	context upToEnd.
	self assert: context peek equals: nil.