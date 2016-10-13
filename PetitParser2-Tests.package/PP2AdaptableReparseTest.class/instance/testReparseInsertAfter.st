tests
testReparseInsertAfter
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	
	context := self assert: parser parse: 'a '.
	self assert: context returnValue value = 'a'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 1.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2InsertCharacter on: 'a  ' at: 3).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 1.
	self assert: context debugResult steps equals: 5.
