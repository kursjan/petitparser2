testing
isAndLiteralObject: node 
	self assert: (node isKindOf: PP2AndNode).
	^ (node child isKindOf: PP2LiteralObjectNode) 