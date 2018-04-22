tests
testReparseInsertInRange
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1, #space asPParser star ==> #second.
	context := self assert: parser parse: 'aa'.
	self assert: context returnValue value = 'aa'.
	self assert: context debugResult steps equals: 10.
	
	context applyChange: (PP2InsertCharacter on: 'aaa' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aaa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 3.
	self assert: context debugResult steps equals: 11.