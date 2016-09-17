tests
testGuardStarEmpty
	| invocations parserOne wrappedOne |
	invocations := OrderedCollection new.
	parserOne := nil asPParser ==> [ :e | invocations add: #a. e. ], $a asPParser.

	wrappedOne := parserOne wrapped trim flatten. 

	self assert: wrappedOne star optimize parse: 'c' to: #() end: 0.
	self assert: invocations size equals: 0