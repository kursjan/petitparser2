test - conversion
testPPTrimmingParserConversion
	| converted parser |

	parser := nil asParser trim.
	parser setTrimmer: #foo.
		
	converted := parser asPetit2Node.
	self assert: (converted isKindOf: PP2TrimmingNode).
	self assert: (converted trimmer = #foo).