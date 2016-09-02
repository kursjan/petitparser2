support
optimize: node
	PP2AcceptsEpsilonCache new doPass: node.
	PP2FirstSetCache new doPass: node.
	PP2GuardVisitor new doPass: node