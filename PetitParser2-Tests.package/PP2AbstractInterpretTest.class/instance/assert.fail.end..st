utilities
assert: aGrammar fail: aCollection end: anInteger
	| stream result context |
	self 
		assert: aGrammar isPetit2Parser
		description: 'Parser invalid'.
	stream := aCollection asPetit2Stream.	
	
	result := self interpret: stream grammar: aGrammar.
	self 
		assert: result isPetit2Failure
		description: 'Parser did not fail'.
	self
		assert: result position = anInteger
		description: 'Parser failed at wrong position'.
	^ result