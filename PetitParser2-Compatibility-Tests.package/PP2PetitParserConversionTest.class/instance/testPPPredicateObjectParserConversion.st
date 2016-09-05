test - conversion
testPPPredicateObjectParserConversion
	| converted parser |

	parser := #letter asParser.
	converted := parser asPetit2Node.

	self assert: (converted isKindOf: PP2PredicateObjectNode).
	self assert: (converted predicate = parser block).
	self assert: (converted predicateMessage = parser message).
	self assert: (converted negated = (parser instVarNamed: 'negated')).
	self assert: (converted negatedMessage  = (parser instVarNamed: 'negatedMessage')).			