tests
testIdentifierTrimmingToken
	parser := (#letter asPParser, #word asPParser star) token trim.
	
	parser optimize.
	
	self assert: parser child strategy isKindOf: PP2SequenceOfTwoRecognizer.
	self assert: parser child firstChild strategy isKindOf: PP2PredicateObjectRecognizer.
	self assert: parser child secondChild strategy isKindOf: PP2StarPredicateObjectRecognizer.