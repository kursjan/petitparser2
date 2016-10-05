parsing
initializeFor: aNode
	super initializeFor: aNode.
	
	tokenClass := aNode child tokenClass.
	tokenChild := aNode child child.
	trimmer := aNode trimmer.