test - conversion
testPPEndOfLineParserConversion
	| converted parser |

	parser := PPEndOfLineParser new.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2EndOfLineNode).