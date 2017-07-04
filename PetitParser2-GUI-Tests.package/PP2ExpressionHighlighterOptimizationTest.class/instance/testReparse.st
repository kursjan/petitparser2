as yet unclassified
testReparse
	context := '1 + 2' asReparsableContext.
	
	self assert: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 48.
	
	context applyChange: (PP2InsertCharacter on: '91 + 2' at: 1).
	self assert: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 24.

	context applyChange: (PP2InsertCharacter on: '981 + 2' at: 2).
	self assert: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 24.
