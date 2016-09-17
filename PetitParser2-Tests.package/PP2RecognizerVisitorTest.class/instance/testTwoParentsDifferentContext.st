tests
testTwoParentsDifferentContext
	| wrapped |
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).
	wrapped := parser wrapped.

	token := wrapped token.
	sequence := wrapped, token.
	
	self visit: sequence.
	
	self assert: parser warnings size equals: 1.
	self assert: parser strategy isKindOf: PP2StarPredicateObject.