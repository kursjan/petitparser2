tests
testNestedBlockEmpty
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{}'.
	self assert: result size equals: 3.
	self assert: result first equals: ${.
	self assert: result second equals: ''.
	self assert: result third equals: $}.