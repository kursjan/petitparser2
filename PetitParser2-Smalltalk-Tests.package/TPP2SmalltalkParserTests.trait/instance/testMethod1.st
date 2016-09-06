testing
testMethod1
	super testMethod1.
	self assert: self result isMethod.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1.
	self assert: self result body statements first isReturn.
	self assert: self result body statements first value isMessage.
	self assert: self result body statements first value receiver isLiteralNode.
	self assert: self result body statements first value selector equals: #-.
	self assert: self result body statements first value arguments size equals: 1.
	self assert: self result body statements first value arguments first isVariable