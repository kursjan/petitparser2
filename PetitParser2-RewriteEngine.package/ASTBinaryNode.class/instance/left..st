generated
left: anASTExpressionNode
	self left notNil
		ifTrue: [ self left parent: nil ].
	left := anASTExpressionNode.
	self left notNil
		ifTrue: [ self left parent: self ]