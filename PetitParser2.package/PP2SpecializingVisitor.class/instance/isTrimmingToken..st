testing
isTrimmingToken: node 
	self assert: (node isKindOf: PP2TrimmingNode).

	^ node child isKindOf: PP2TokenNode
	
	"
		self new isTrimmingToken: 'foo' asPParser token trim.
	"