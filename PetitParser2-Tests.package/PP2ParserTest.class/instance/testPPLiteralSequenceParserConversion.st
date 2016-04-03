test - conversion
testPPLiteralSequenceParserConversion
	| converted parser |

	parser := 'foo' asParser.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2LiteralSequenceParser).
	self assert: (converted literal = 'foo').
	self assert: (converted message = '''foo'' expected')