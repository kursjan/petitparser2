tests
testSuccess
	| context |
	context := (self contextOn: 'bar')
		position: 1;
		returnValue: #foo;
		yourself.
	
	self assert: context isPetit2Success.
	self assert: context value == #foo.
	self assert: context returnValue == #foo.
	self assert: context atEnd not.
	self assert: context uncheckedPeek == $a.