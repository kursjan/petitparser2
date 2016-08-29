initialization
initializeFor: aPP2Node
	super initializeFor: aPP2Node.
	
	predicate := node child predicate.
	failure := PP2Failure new message: 'predicate not found'