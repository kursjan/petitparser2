tests
testNestedBlockEmpty
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{}'.
	self assert: self result size equals: 3.
	self assert: self result first equals: ${.
	self assert: self result second equals: #() asOrderedCollection.
	self assert: self result third equals: $}.