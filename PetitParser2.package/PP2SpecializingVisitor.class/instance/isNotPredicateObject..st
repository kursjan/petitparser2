testing
isNotPredicateObject: node 
	self assert: (node isKindOf: PP2NotNode).
	^ (node child isKindOf: PP2PredicateObjectNode) 