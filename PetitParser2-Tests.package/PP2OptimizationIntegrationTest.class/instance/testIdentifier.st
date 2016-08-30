tests
testIdentifier
	parser := #letter asParser2, #word asParser2 star.
	
	parser optimize.
	
	self assert: parser strategy isKindOf: PP2SequenceOfTwo.
	self assert: parser secondChild strategy isKindOf: PP2StarPredicateObject.