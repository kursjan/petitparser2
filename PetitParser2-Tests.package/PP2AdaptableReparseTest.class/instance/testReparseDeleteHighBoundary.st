tests
testReparseDeleteHighBoundary
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	context := self assert: parser parse: 'a  '.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2DeleteCharacter on: 'a ' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.