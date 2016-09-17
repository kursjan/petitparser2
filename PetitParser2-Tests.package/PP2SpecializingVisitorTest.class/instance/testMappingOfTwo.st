tests
testMappingOfTwo
	parser := ($a asPParser, $b asPParser) map: [ :a :b | $c ].
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2MappingOfTwo.