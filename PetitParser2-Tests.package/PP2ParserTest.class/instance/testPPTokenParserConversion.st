test - conversion
testPPTokenParserConversion
	| converted parser |

	parser := nil asParser token.
	parser tokenClass: #foo.
		
	converted := parser asPetit2Node.
	self assert: (converted isKindOf: PP2TokenParser).
	self assert: (converted tokenClass = #foo).