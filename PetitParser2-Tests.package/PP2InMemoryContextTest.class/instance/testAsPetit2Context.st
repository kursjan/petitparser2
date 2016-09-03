tests - converting
testAsPetit2Context
	| context |
	context := 'foo' asPetit2Stream asPetit2Context.
	
	self assert: (context isKindOf: PP2InMemoryContext).
	self assert: context isPetit2Success.