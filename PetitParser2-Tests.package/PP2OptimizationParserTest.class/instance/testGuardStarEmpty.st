tests
testGuardStarEmpty
	| invocations parserOne wrappedOne |
	invocations := OrderedCollection new.
	parserOne := nil asParser2 ==> [ :e | invocations add: #a. e. ], $a asParser2.

	wrappedOne := parserOne wrapped trim flatten. 

	self assert: wrappedOne star optimize parse: 'c' to: #() end: 0.
	self assert: invocations size equals: 0