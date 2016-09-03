tests
testUncheckedPeek
	| context |
	context := self contextOn: 'foo'.
		
	self assert: context uncheckedPeek == $f.
	
	context position: 3.
	self should: [context uncheckedPeek] raise: Error.
	