testing
testSequence1
	super testSequence1.
	self assert: self result isSequence.
	self assert: self result temporaries size equals: 1.
	self assert: self result temporaries first isVariable.
	self assert: self result temporaries first name equals: 'a'.
	self assert: self result statements size equals: 2.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements second isLiteralNode.
	self assert: self result statements second value equals: 2