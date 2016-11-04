tests
testContents
	| result |
	result := PP2DebugResult new.
	result context: 'a' asPetit2Context.
	
	self assert: result contents equals: 'a'