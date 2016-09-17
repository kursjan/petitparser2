tests
testAndPredicateObject
	self assert: #letter asPParser and parse: 'a' to: $a end: 0.
	self assert: #letter asPParser and parse: 'z' to: $z end: 0.	
	self assert: #letter asPParser and fail: '1' end: 0.