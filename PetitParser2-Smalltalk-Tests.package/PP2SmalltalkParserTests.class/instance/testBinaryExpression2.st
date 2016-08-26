testing-messages
testBinaryExpression2
	super testBinaryExpression2.
	self assert: result isMessage.
	self assert: result receiver isMessage.
	self assert: result receiver receiver isLiteralNode.
	self assert: result receiver receiver value equals: 1.
	self assert: result receiver arguments size equals: 1.
	self assert: result receiver arguments first isLiteralNode.
	self assert: result receiver arguments first value equals: 2.
	self assert: result arguments size equals: 1.
	self assert: result arguments first isLiteralNode.
	self assert: result arguments first value equals: 3