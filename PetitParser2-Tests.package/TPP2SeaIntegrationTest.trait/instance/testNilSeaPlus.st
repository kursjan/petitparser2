tests
testNilSeaPlus
	| sea parser |

	sea := self seaInstance island: nil asPParser.
	parser := sea flatten nonEpsilon plus.
	
	self assert: parser fail: ''.


	self assert: parser parse: '...'.
	self assert: self result size equals: 1.
	self assert: self result first equals: '...'.

