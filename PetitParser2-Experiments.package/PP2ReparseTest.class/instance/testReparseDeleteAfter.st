tests
testReparseDeleteAfter
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	
	context := self assert: parser parse: 'aa  '.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 2.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2DeleteCharacter on: 'aa ' at: 4).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 2.
	self assert: context debugResult steps equals: 5.
