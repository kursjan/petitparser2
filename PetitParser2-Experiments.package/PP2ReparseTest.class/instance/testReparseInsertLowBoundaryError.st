tests
testReparseInsertLowBoundaryError
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1 ==> #second.
	context := self assert: parser parse: ' a'.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2InsertCharacter on: '  a' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.