tests
testSuccess
	| context |
	context := (self contextOn: 'bar')
		position: 1;
		retval: #foo;
		yourself.
	
	self assert: context isPetit2Success.
	self assert: context value == #foo.
	self assert: context retval == #foo.
	self assert: context atEnd not.
	self assert: context uncheckedPeek == $a.