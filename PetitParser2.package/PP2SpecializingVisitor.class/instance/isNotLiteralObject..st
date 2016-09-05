testing
isNotLiteralObject: node 
	self assert: (node isKindOf: PP2NotNode).
	^ (node child isKindOf: PP2LiteralObjectNode) 