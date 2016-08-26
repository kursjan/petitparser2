testing-messages
testCascadeExpression2
	super testCascadeExpression2.
	self assert: result isCascade.
	self assert: result receiver isMessage.
	self assert: result receiver receiver isLiteralNode.
	self assert: result receiver receiver value equals: 1.
	self assert: result receiver selector equals: #abs.
	self assert: result receiver keywordsPositions equals: #(3) asIntegerArray.
	self assert: result messages size equals: 3.
	self assert: result messages first receiver equals: result receiver.
	self assert: result messages first selector equals: #negated.
	self assert: result messages first keywordsPositions equals: #(7) asIntegerArray.
	self assert: result messages second receiver equals: result receiver.
	self assert: result messages second selector equals: #raisedTo:.
	self assert: result messages second keywordsPositions equals: #(16) asIntegerArray.
	self assert: result messages third receiver equals: result receiver.
	self assert: result messages third selector equals: #negated.
	self assert: result messages third keywordsPositions equals: #(30) asIntegerArray