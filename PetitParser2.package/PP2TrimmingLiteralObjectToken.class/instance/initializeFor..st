as yet unclassified
initializeFor: aNode
	| token |
	super initializeFor: aNode.
	
	token := aNode child.
	literal := token childSkipDelegate literal.

	failure := PP2Failure message: 'literal expected'