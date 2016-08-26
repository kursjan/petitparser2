testing
testSequence1
	super testSequence1.
	self assert: result isSequence.
	self assert: result temporaries size equals: 1.
	self assert: result temporaries first isVariable.
	self assert: result temporaries first name equals: 'a'.
	self assert: result statements size equals: 2.
	self assert: result statements first isLiteralNode.
	self assert: result statements first value equals: 1.
	self assert: result statements second isLiteralNode.
	self assert: result statements second value equals: 2