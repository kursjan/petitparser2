tests
testIdentifierTrimmingToken
	parser := (#letter asPParser, #word asPParser star) token trim.
	
	parser optimize.
	
	self assert: parser strategy isKindOf: PP2TrimmingToken.
	self assert: parser strategy tokenChild strategy isKindOf: PP2SequenceOfTwoRecognizer.
	self assert: parser strategy tokenChild firstChild strategy isKindOf: PP2PredicateObjectRecognizer.
	self assert: parser strategy tokenChild secondChild strategy isKindOf: PP2StarPredicateObjectRecognizer.