test - conversion
testPPPossesiveRepeatingParserConversion
	| converted parser |

	parser := (nil asParser star)
		setMin: 1; 
		setMax: 2;
		yourself.
		
	converted := parser asPetit2Node.
	self assert: (converted isKindOf: PP2PossesiveRepeatingNode).
	self assert: (converted min = 1).
	self assert: (converted max = 2).	