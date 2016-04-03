test - conversion
testPPOptionalParserConversion
	| converted parser |

	parser := nil asParser optional.
		
	converted := parser asPetit2Node.
	self assert: (converted isKindOf: PP2OptionalParser).
