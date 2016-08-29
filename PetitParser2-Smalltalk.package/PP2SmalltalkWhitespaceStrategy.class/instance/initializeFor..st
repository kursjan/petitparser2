as yet unclassified
initializeFor: aPP2Node
	super initializeFor: aPP2Node.
	
	failure := PP2Failure new 
		message: 'no whitespace found';
		yourself