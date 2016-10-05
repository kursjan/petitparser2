testing
isTrimmingLiteralObjectToken: node 
	self assert: (node isKindOf: PP2TrimmingNode).
	
	(node child isKindOf: PP2TokenNode) ifFalse: [ ^ false ].
	^ (node child childSkipDelegate isKindOf: PP2LiteralObjectNode) 
	
	"
		self new isTrimmingLiteralObjectToken: $a asPParser token trim.
	"