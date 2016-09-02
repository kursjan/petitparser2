tests
testDelegateBypass
	parser := #letter asParser2 wrapped optimize.
	
	self assert: parser strategy isKindOf: PP2DelegateBypass