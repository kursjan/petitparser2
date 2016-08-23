test - conversion
testPPPlusParserConversion
	| converted parser |

	parser := (nil asParser plus).
			
	converted := parser asPetit2Node.
	self assert: (converted isKindOf: PP2PossesiveRepeatingParser).
	self assert: (converted min = 1).