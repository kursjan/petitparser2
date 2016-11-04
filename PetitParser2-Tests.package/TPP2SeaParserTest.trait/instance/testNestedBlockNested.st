tests
testNestedBlockNested
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{ {} }'.
	self assert: self result size equals: 3.
	self assert: self result first equals: ${.
	self assert: self result second size equals: 1.
	self assert: self result second first size equals: 3.
	self assert: self result third equals: $}.