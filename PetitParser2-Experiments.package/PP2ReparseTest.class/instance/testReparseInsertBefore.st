tests
testReparseInsertBefore
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1 ==> #second.
	
	context := self assert: parser parse: ' a'.
	self assert: context returnValue value = 'a'.
	self assert: context returnValue start = 2.
	self assert: context returnValue stop = 2.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2InsertCharacter on: '  a' at: 1).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context returnValue start = 3.
	self assert: context returnValue stop = 3.
	
	self assert: context debugResult steps equals: 5.