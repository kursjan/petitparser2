tests
testNotPredicateObject
	self assert: #letter asPParser not parse: '0' to: nil end: 0.
	self assert: #letter asPParser not parse: '_' to: nil end: 0.	
	self assert: #letter asPParser not fail: 'a' end: 0.