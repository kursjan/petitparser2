as yet unclassified
testRecoverFromFailureMoreLookahead
	context := '1 + ' asReparsableContext.
	
	self fail: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 29.

	context applyChange: (PP2InsertCharacter on: '1 + 2' at: 5).
	self assert: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 45.