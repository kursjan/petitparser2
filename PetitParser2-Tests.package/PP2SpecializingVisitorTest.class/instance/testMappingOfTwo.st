tests
testMappingOfTwo
	parser := ($a asParser2, $b asParser2) map: [ :a :b | $c ].
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2MappingOfTwo.