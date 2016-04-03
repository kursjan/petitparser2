test - conversion
testPPStartOfLineParserConversion
	| converted parser |

	parser := PPStartOfLineParser new.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2StartOfLineNode).