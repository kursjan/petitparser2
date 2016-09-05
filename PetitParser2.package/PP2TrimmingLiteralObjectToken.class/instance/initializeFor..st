as yet unclassified
initializeFor: aNode
	super initializeFor: aNode.
	
	node child isJustDelegate ifTrue: [ 
		literal := aNode child child literal
	] ifFalse: [ 
		literal := aNode child literal
	].
	failure := PP2Failure message: 'literal expected'