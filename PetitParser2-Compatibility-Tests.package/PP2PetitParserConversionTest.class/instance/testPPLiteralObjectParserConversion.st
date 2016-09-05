test - conversion
testPPLiteralObjectParserConversion
	| converted parser |

	parser := $a asParser.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2LiteralObjectNode).
	self assert: (converted literal = $a).
	self assert: (converted message = '$a expected')