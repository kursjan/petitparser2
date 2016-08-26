testing
testArray1
	super testArray1.
	self assert: result isArray.
	self assert: result statements isEmpty.
	self assert: result periods isEmpty