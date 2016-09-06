testing
testTemporaries1
	super testTemporaries1.
	self assert: self result isSequence.
	self assert: self result temporaries size equals: 1.
	self assert: self result temporaries first isVariable.
	self assert: self result temporaries first name equals: 'a'.
	self assert: self result statements isEmpty