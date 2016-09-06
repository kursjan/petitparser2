tests
testGuardPlusTwo
	| invocations parserOne wrappedOne |
	invocations := OrderedCollection new.
	
	parserOne := $a asParser2 >==> [ :c :cc | invocations add: #a. cc value. ].
	wrappedOne := parserOne wrapped trim flatten >==> [:c :cc | invocations add: #plus. cc value ]. 

	self assert: wrappedOne plus optimize parse: 'aa' to: #('a' 'a') end: 2.
	self assert: invocations size equals: 6