tests
testNotPredicateObject
	self assert: #letter asParser2 not parse: '0' to: nil end: 0.
	self assert: #letter asParser2 not parse: '_' to: nil end: 0.	
	self assert: #letter asParser2 not fail: 'a' end: 0.