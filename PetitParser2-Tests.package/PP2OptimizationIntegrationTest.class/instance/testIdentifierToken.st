tests
testIdentifierToken
	parser := (#letter asPParser, #word asPParser star) token.
	
	parser optimize.
	
	self assert: parser child strategy isKindOf: PP2SequenceOfTwoRecognizer.
	self assert: parser child secondChild strategy isKindOf: PP2StarPredicateObjectRecognizer.