tests
testAtEnd
	| context |
	context := self contextOn: 'foo'.
	
	self deny: context atEnd.
	context next: 3.
	self assert: context atEnd.
