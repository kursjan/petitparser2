tests
testNullableIsland
	| parser sea |

	sea := self seaInstance island: nil asPParser.
	parser := sea.
	
	self assert: parser parse: '..'.
	self assert: self result first equals: '..'.
	self assert: self result second equals: nil.
	self assert: self result third equals: ''.


	self assert: parser parse: ''.