testing
testAssignment4
	super testAssignment4.
	PPSmalltalkGrammar allowUnderscoreAssignment
		ifFalse: [ ^ self ].
	self assert: result isAssignment.
	self assert: result variable isVariable.
	self assert: result variable name equals: 'a'.
	self assert: result value isLiteralNode.
	self assert: result value value equals: 1