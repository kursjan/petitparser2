tests
testAndPredicateObject
	self assert: #letter asParser2 and parse: 'a' to: $a end: 0.
	self assert: #letter asParser2 and parse: 'z' to: $z end: 0.	
	self assert: #letter asParser2 and fail: '1' end: 0.