visiting
visitEnd: node
	self addAll: currentNext to: node.
	"TODO JK: not sure if to add #eoi asPParser"
	self visitChildrenOf: node