testing-messages
testBinaryExpression2
	super testBinaryExpression2.
	self assert: self result isMessage.
	self assert: self result receiver isMessage.
	self assert: self result receiver receiver isLiteralNode.
	self assert: self result receiver receiver value equals: 1.
	self assert: self result receiver arguments size equals: 1.
	self assert: self result receiver arguments first isLiteralNode.
	self assert: self result receiver arguments first value equals: 2.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 3