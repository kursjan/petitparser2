testing-messages
testCascadeExpression1
	super testCascadeExpression1.
	self assert: result isCascade.
	self assert: result receiver isLiteralNode.
	self assert: result messages size equals: 2.
	self assert: result messages first receiver equals: result receiver.
	self assert: result messages first selector equals: #abs.
	self assert: result messages first keywordsPositions equals: #(3) asIntegerArray.
	self assert: result messages second receiver equals: result receiver.
	self assert: result messages second selector equals: #negated.
	self assert: result messages second keywordsPositions equals: #(8) asIntegerArray