test - conversion
testPPPluggableParserConversion
	| converted parser block |

	block := [ :e | e next ].
	parser := block asParser.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2PluggableParser).
	self assert: (converted block  == block).