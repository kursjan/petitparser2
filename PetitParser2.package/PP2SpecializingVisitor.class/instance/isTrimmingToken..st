testing
isTrimmingToken: node 
	self assert: (node isKindOf: PP2TrimmingNode).

	^ node child isKindOf: PP2CreateTokenNode
	
	"
		self new isTrimmingToken: 'foo' asPParser token trim.
	"