tests
testReparseInsertHighBoundaryError
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	context := self assert: parser parse: 'aa a' end: 3.
	self assert: context returnValue value = 'aa'.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2InsertCharacter on: 'a  ' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.