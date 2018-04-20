test
testPredicateDigit
	|  parser |
	
	parser := #digit asPParser.

	self assert: parser parse: '1' to: $1.
	self assert: parser parse: '0' to: $0.
	self assert: parser parse: '9' to: $9.
	self assert: parser fail: 'a'.