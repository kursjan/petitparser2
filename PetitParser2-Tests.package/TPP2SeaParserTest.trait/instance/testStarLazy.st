tests
testStarLazy
	| parser |

	parser := #letter asPParser starLazy.
	
	self assert: parser parse: 'abcd'.
	self assert: self result size equals: 4.