tests
testIdentifier
	parser := #letter asPParser, #word asPParser star.
	
	parser optimize.
	
	self assert: parser strategy isKindOf: PP2SequenceOfTwo.
	self assert: parser secondChild strategy isKindOf: PP2StarPredicateObject.