tests
testGuardOptional
	| invocations parserOne wrappedOne |
	invocations := OrderedCollection new.

	parserOne := $a asPParser >==> [ :c :cc | invocations add: #a. cc value. ].
	wrappedOne := parserOne wrapped trim flatten >==> [:c :cc | invocations add: #opt. cc value ]. 

	self assert: wrappedOne optional optimize parse: 'a' to: 'a' end: 1.
	self assert: invocations size equals: 2