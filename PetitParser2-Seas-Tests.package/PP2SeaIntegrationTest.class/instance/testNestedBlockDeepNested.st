tests
testNestedBlockDeepNested
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{ {} { {  } } }'.
	self assert: result size equals: 3.
	self assert: result first equals: ${.
	self assert: result second size equals: 2.
	self assert: result second first size equals: 3.
	self assert: result second second size equals: 3.
	self assert: result third equals: $}.