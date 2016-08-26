testing
testTemporaries1
	super testTemporaries1.
	self assert: result isSequence.
	self assert: result temporaries size equals: 1.
	self assert: result temporaries first isVariable.
	self assert: result temporaries first name equals: 'a'.
	self assert: result statements isEmpty