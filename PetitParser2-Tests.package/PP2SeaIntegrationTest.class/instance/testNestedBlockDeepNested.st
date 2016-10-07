tests
testNestedBlockDeepNested
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{ {} { {  } } }'.
	self assert: self result size equals: 3.
	self assert: self result first equals: ${.
	self assert: self result second size equals: 2.
	self assert: self result second first size equals: 3.
	self assert: self result second second size equals: 3.
	self assert: self result third equals: $}.