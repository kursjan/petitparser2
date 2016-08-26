testing
testMethod2
	super testMethod2.
	self assert: result isMethod.
	self assert: result arguments isEmpty.
	self assert: result body temporaries isEmpty.
	self assert: result body statements size equals: 1.
	self assert: result body statements first isReturn.
	self assert: result body statements first value isMessage.
	self assert: result body statements first value receiver isLiteralNode.
	self assert: result body statements first value selector equals: #-.
	self assert: result body statements first value arguments size equals: 1.
	self assert: result body statements first value arguments first isVariable