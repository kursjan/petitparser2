tests
testReparseDeleteBefore
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1 ==> #second.
	
	context := self assert: parser parse: ' aa'.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 2.
	self assert: context returnValue stop = 3.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2DeleteCharacter on: 'aa' at: 1).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 2.
	
	self assert: context debugResult steps equals: 5.