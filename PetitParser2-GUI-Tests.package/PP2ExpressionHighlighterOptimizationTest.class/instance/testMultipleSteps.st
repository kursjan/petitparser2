as yet unclassified
testMultipleSteps
	context := '1' asReparsableContext.
	
	self assert: highlighter reparseWithContext: context.
	self assert: (highlighter allCaches detect: #isReparsable) buffer anyOne value furthestPosition equals: 1.

	context applyChange: (PP2InsertCharacter on: '1 ' at: 2).
	self fail: highlighter reparseWithContext: context.
	self assert: (highlighter allCaches detect: #isReparsable) buffer anyOne value furthestPosition equals: 2.

	context applyChange: (PP2InsertCharacter on: '1 +' at: 3).
	self fail: highlighter reparseWithContext: context.

	context applyChange: (PP2InsertCharacter on: '1 +2' at: 4).
	self assert: highlighter reparseWithContext: context.
	"
		(highlighter allCaches detect: #isReparsable) buffer
	"
	
