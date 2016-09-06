testing
testTemporaries2
	super testTemporaries2.
	self assert: self result isSequence.
	self assert: self result temporaries size equals: 2.
	self assert: self result temporaries first isVariable.
	self assert: self result temporaries first name equals: 'a'.
	self assert: self result temporaries second isVariable.
	self assert: self result temporaries second name equals: 'b'.
	self assert: self result statements isEmpty