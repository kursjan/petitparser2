testing-messages
testCascadeExpression3
	super testCascadeExpression3.
	self assert: result isCascade.
	self assert: result receiver isLiteralNode.
	self assert: result receiver value equals: 1.
	self assert: result messages size equals: 2.
	self assert: result messages first receiver equals: result receiver.
	self assert: result messages first selector equals: #+.
	self assert: result messages first keywordsPositions equals: #(3) asIntegerArray.				
	self assert: result messages first arguments size equals: 1.
	self assert: result messages second receiver equals: result receiver.
	self assert: result messages second selector equals: #-.
	self assert: result messages second keywordsPositions equals: #(8) asIntegerArray.				
	self assert: result messages second arguments size equals: 1