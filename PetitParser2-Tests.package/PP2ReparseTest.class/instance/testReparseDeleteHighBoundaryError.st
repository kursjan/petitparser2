tests
testReparseDeleteHighBoundaryError
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	context := self assert: parser parse: 'a a' end: 2.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2DeleteCharacter on: 'aa' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value equals: 'aa'.
	self assert: context returnValue start equals: 1.
	self assert: context debugResult steps equals: 9.