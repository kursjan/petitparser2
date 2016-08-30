test - conversion
testPPEpsilonParserConversion
	| converted parser |

	parser := nil asParser.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2EpsilonNode).