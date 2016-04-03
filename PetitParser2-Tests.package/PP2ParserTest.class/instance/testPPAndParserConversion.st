test - conversion
testPPAndParserConversion
	| converted parser |

	parser := nil asParser and.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2AndParser).