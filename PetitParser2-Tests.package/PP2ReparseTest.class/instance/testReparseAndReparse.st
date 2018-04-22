tests
testReparseAndReparse
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser plus ==> #first.
	
	context := 'aa  ' asReparsableContext. 
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 2.
	self assert: context debugResult steps equals: 9.
	
	context := 'aaa ' asReparsableContext.
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aaa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 3.
	self assert: context debugResult steps equals: 10.