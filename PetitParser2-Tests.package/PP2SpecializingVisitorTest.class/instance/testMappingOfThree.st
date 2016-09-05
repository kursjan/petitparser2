tests
testMappingOfThree
	parser := ($a asParser2, $b asParser2, $c asParser2) map: [ :a :b :c | $d ].
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2MappingOfThree.