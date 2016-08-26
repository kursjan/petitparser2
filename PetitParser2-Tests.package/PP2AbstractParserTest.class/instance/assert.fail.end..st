utilities
assert: aParser fail: aCollection end: anInteger
	| stream result context |
	self 
		assert: aParser isPetit2Parser
		description: 'Parser invalid'.
	stream := aCollection asPetit2Stream.
	context := self context.
	
	
	result := self parse: stream withParser: aParser withContext: context.
	
	self 
		assert: result isPetit2Failure
		description: 'Parser did not fail'.
	self
		assert: result position = anInteger
		description: 'Parser failed at wrong position'.
	^ result