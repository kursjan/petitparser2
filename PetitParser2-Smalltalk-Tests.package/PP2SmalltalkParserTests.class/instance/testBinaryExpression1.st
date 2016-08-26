testing-messages
testBinaryExpression1
	super testBinaryExpression1.
	self assert: result isMessage.
	self assert: result receiver isLiteralNode.
	self assert: result receiver value equals: 1.
	self assert: result arguments size equals: 1.
	self assert: result arguments first isLiteralNode.
	self assert: result arguments first value equals: 2