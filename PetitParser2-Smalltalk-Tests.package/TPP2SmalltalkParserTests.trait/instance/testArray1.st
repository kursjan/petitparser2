testing
testArray1
	super testArray1.
	self assert: self result isArray.
	self assert: self result statements isEmpty.
	self assert: self result periods isEmpty