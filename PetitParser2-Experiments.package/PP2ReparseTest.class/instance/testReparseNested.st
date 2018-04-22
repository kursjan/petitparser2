tests
testReparseNested
	token1 := $a asPParser plus token reparsable.
	
	parser := (#space asPParser plus, token1) reparsable ==> #second.
	
	context := self assert: parser parse: '  aa'.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 3.
	self assert: context returnValue stop = 4.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2InsertCharacter on: '   aa' at: 1).
	context := self assert: parser reparseWithContext: context.
	self assert: context debugResult steps equals: 5.
	
	context applyChange: (PP2InsertCharacter on: '    aa' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context debugResult steps equals: 5.