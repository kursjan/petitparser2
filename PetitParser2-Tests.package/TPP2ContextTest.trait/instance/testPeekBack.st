tests
testPeekBack
	| context |
	context := self contextOn: 'bar'.
	self should: [ context peekBack ] raise: Exception.
	
	context upToEnd.	
	self assert: context peekBack equals: $r.