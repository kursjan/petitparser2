tests
testTrimming
	parser := #letter asPParser trim optimize.
	
	self assert: parser trimmer strategy isKindOf: PP2TrimmingCache.
	self assert: parser trimmer strategy strategy isKindOf: PP2StarPredicateObjectRecognizer.