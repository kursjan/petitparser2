tests
testGuardChoiceOptionTwo
	| invocations parserOne parserTwo wrappedOne wrappedTwo |
	invocations := OrderedCollection new.
	parserOne := $a asParser2 >==> [ :c :cc | invocations add: #a. cc value ].
	parserTwo := $b asParser2 >==> [ :c :cc | invocations add: #b. cc value ].


	wrappedOne := parserOne wrapped trim flatten. 
	wrappedTwo := parserTwo wrapped trim flatten.

	self assert: (wrappedOne / wrappedTwo) optimize parse: 'b ' to: 'b '.
	self assert: invocations size equals: 1