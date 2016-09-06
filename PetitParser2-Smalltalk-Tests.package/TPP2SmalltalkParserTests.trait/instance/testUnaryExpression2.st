testing-messages
testUnaryExpression2
	super testUnaryExpression2.
	self assert: self result isMessage.
	self assert: self result receiver isMessage.
	self assert: self result receiver receiver isLiteralNode.
	self assert: self result receiver receiver value equals: 1.
	self assert: self result receiver selector equals: #abs.
	self assert: self result receiver keywordsPositions equals: #(3) asIntegerArray.		
	self assert: self result receiver arguments isEmpty.
	self assert: self result selector equals: #negated.
	self assert: self result keywordsPositions equals: #(7) asIntegerArray.		
	self assert: self result arguments isEmpty