tests
testSeaPlus
	| sea parser |

	sea := self seaInstance island: $a asPParser.
	parser := sea plus.

	self assert: parser parse: '..a..a..a...'.
	self assert: self result size equals: 3.	

	self assert: parser fail: '...'.
