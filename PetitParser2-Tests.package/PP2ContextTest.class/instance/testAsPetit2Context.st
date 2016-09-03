tests
testAsPetit2Context
	| context |
	context := (PP2MinimalStream on: 'foo') asPetit2Stream asPetit2Context.
	
	self assert: (context isKindOf: PP2Context).
	self assert: context isPetit2Success.