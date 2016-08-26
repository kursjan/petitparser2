testing
testAssignment4
	PPSmalltalkGrammar allowUnderscoreAssignment
		ifTrue: [ self parse: 'a _ 1' rule: #expression ]
		ifFalse: [ self fail: 'a _ 1' rule: #expression ]