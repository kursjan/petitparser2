testing
testAsPetit2Context
	context := 'foo' asPetit2Stream asPetit2ImmutableContext.
	
	self assert: (context isKindOf: PP2ImmutableContext).
	self assert: context isPetit2Success.