testing
testAssignment5
	PPSmalltalkGrammar allowUnderscoreAssignment
		ifTrue: [ self parse: 'a _ b _ 1' rule: #expression ]
		ifFalse: [ self fail: 'a _ b _ 1' rule: #expression ]