test - conversion
testPPLiteralObjectParserConversion
	| converted parser |

	parser := $a asParser.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2LiteralObjectParser).
	self assert: (converted literal = $a).
	self assert: (converted message = '$a expected')