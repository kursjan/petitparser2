testing
isAndPredicateObject: node 
	self assert: (node isKindOf: PP2AndNode).
	^ (node child isKindOf: PP2PredicateObjectNode) 