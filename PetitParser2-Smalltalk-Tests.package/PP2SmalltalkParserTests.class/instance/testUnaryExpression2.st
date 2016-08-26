testing-messages
testUnaryExpression2
	super testUnaryExpression2.
	self assert: result isMessage.
	self assert: result receiver isMessage.
	self assert: result receiver receiver isLiteralNode.
	self assert: result receiver receiver value equals: 1.
	self assert: result receiver selector equals: #abs.
	self assert: result receiver keywordsPositions equals: #(3) asIntegerArray.		
	self assert: result receiver arguments isEmpty.
	self assert: result selector equals: #negated.
	self assert: result keywordsPositions equals: #(7) asIntegerArray.		
	self assert: result arguments isEmpty