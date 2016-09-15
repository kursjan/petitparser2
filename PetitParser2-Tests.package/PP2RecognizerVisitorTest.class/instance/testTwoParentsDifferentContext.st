tests
testTwoParentsDifferentContext
	| wrapped |
	parser := #letter asParser2 star.
	parser strategy: (PP2StarPredicateObject on: parser).
	wrapped := parser wrapped.

	token := wrapped token.
	sequence := wrapped, token.
	
	self visit: sequence.
	
	self assert: parser warnings size equals: 1.
	self assert: parser strategy isKindOf: PP2StarPredicateObject.