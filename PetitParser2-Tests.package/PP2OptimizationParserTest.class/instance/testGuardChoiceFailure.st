tests
testGuardChoiceFailure
	| invocations parserOne parserTwo wrappedOne wrappedTwo |
	invocations := OrderedCollection new.
	parserOne := $a asPParser >==> [ :c :cc | invocations add: #a. cc value ].
	parserTwo := $b asPParser >==> [ :c :cc | invocations add: #b. cc value ].

	wrappedOne := parserOne wrapped trim flatten. 
	wrappedTwo := parserTwo wrapped trim flatten.

	self assert: (wrappedOne / wrappedTwo) optimize fail: 'c'.
	self assert: invocations size equals: 0