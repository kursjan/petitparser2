tests - converting
testAsPetit2ContextDirect
	| context |
	context := 'foo' asPetit2Context.
	self assert: context isKindOf: PP2InMemoryContext.
	self assert: context start equals: 0.
	self assert: context readLimit equals: 3