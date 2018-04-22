tests
testReparseMultipleChangesAtEnd
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser plus, token1 ==> #second.
	
	context := '  aa' asReparsableContext. 
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 3.
	self assert: context returnValue stop = 4.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2InsertCharacter on: '  aaa' at: 4).
	context applyChange: (PP2InsertCharacter on: '  aaaa' at: 5).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aaaa'.
	self assert: context returnValue start = 3.
	self assert: context returnValue stop = 6.
	
	self assert: context debugResult steps equals: 11.	