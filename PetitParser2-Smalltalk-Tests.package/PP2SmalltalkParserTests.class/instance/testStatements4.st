testing
testStatements4
	super testStatements4.
	self assert: result isSequence.
	self assert: result temporaries isEmpty.
	self assert: result statements size equals: 3.
	self assert: result statements first isLiteralNode.
	self assert: result statements first value equals: 1.
	self assert: result statements first value isInteger.
	self assert: result statements second isLiteralNode.
	self assert: result statements second value equals: 2.
	self assert: result statements second value isInteger.
	self assert: result statements third isLiteralNode.
	self assert: result statements third value equals: 3.
	self assert: result statements third value isInteger