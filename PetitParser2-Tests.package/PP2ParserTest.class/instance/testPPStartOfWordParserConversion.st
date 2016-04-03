test - conversion
testPPStartOfWordParserConversion
	| converted parser |

	parser := PPStartOfWordParser new.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2StartOfWordNode).