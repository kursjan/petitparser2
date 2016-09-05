tests
testBypass
	parser := #letter asParser2 wrapped star optimize.
	
	self assert: parser strategy child isKindOf: PP2PredicateObjectNode