accessing
addition
	^ super addition parseNode
		nodeClass: PP2ExpressionBinaryOperatorNode;
		nodeName: #add;
		yourself