as yet unclassified
testRecoverFromFailure
	context := '1 +' asReparsableContext.
	
	self fail: highliter reparseWithContext: context.
	self assert: context debugResult steps equals: 29.

	context applyChange: (PP2InsertCharacter on: '1+2' at: 3).
	self assert: highliter reparseWithContext: context.
	self assert: context debugResult steps equals: 45.