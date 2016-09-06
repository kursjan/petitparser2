tests
testGuardPlusFailure
	| invocations parserOne wrappedOne |
	invocations := OrderedCollection new.
	
	parserOne := $a asParser2 >==> [ :c :cc | invocations add: #a. cc value. ].
	wrappedOne := parserOne wrapped trim flatten >==> [:c :cc | invocations add: #plus. cc value ]. 

	self assert: wrappedOne plus optimize fail: 'c'.
	self assert: invocations size equals: 0