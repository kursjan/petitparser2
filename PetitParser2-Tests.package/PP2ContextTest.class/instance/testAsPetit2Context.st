testing
testAsPetit2Context
	context := 'foo' asPetit2Stream asPetit2Context.
	
	self assert: (context isKindOf: PP2Context).
	self assert: context isPetit2Success.