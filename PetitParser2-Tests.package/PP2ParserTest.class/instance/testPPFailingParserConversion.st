test - conversion
testPPFailingParserConversion
	| converted parser |

	parser := PPFailingParser new
		setMessage: #foo;
		yourself.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2FailingParser).
	self assert: (converted message = #foo)