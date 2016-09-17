tests
testMappingOfThree
	parser := ($a asPParser, $b asPParser, $c asPParser) map: [ :a :b :c | $d ].
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2MappingOfThree.