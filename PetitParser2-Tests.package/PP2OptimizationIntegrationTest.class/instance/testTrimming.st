tests
testTrimming
	parser := #letter asParser2 trim optimize.
	
	self assert: parser trimmer strategy isKindOf: PP2TrimmingGuard.
	self assert: parser trimmer strategy strategy isKindOf: PP2StarPredicateObjectRecognizer.