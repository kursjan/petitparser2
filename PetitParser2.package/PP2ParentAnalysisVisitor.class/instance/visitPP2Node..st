visiting
visitPP2Node: node
	| tmpParent |
	parent isNil ifFalse: [ node addParent: parent ].

	tmpParent := parent.
	parent := node.
	super visitPP2Node: node.
	parent := tmpParent.
