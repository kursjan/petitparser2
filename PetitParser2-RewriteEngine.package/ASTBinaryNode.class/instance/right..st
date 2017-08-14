generated
right: anASTExpressionNode
	self right notNil
		ifTrue: [ self right parent: nil ].
	right := anASTExpressionNode.
	self right notNil
		ifTrue: [ self right parent: self ]