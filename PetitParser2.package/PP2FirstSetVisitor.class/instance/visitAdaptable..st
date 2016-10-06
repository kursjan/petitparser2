visiting
visitAdaptable: node
	| set |
	set := (self setWithPossible: node).

	"Node can be adpated to anything"
	self addIfPossible: #any asPParser to: set.
	"We don't know if Epsilon is possible or not so we rather add it"
	self addIfPossible: PP2EpsilonNode instance to: set.
	
	^ set