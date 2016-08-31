tests
testIdentifierToken
	parser := (#letter asParser2, #word asParser2 star) token.
	
	parser optimize.
	
	self assert: parser child strategy isKindOf: PP2SequenceOfTwoRecognizer.
	self assert: parser child secondChild strategy isKindOf: PP2StarPredicateObjectRecognizer.