test - conversion
testPPFlattenParserConversion
	| converted parser |

	parser := nil asParser flatten.
		
	converted := parser asPetit2Node.
	self assert: (converted isKindOf: PP2FlattenParser).