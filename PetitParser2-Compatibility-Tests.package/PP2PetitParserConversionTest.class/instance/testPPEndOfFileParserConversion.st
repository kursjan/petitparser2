test - conversion
testPPEndOfFileParserConversion
	| converted parser |

	parser := #eof asParser.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2EndOfInputParser).