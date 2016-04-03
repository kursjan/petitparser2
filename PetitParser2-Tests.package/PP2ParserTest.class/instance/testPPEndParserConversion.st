test - conversion
testPPEndParserConversion
	| converted parser |

	parser := nil asParser end.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2EndParser).