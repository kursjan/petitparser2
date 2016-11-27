tests
testNullableIsland
	| parser sea |

	sea := self seaInstance island: nil asPParser.
	parser := sea.
	
	self assert: parser parse: '..'.
	self assert: self result first equals: #($. $.) asOrderedCollection.
	self assert: self result second equals: nil.
	self assert: self result third equals: #() asOrderedCollection.


	self assert: parser parse: ''.