test - conversion
testPPNotParserConversion
	| converted parser |

	parser := nil asParser not.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2NotParser).