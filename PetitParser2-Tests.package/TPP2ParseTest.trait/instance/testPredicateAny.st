test
testPredicateAny
	|  parser |
	
	parser := #any asPParser.

	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: Character null asString to: Character null.
	
	self assert: parser fail: ''.