testing
testStatements2
	super testStatements2.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 2.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger.
	self assert: self result statements second isLiteralNode.
	self assert: self result statements second value equals: 2.
	self assert: self result statements second value isInteger