tests
testPredicateAny
	|  parser |
	
	parser := #any asParser2.

	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: Character null asString to: Character null.
	
	self assert: parser fail: ''.