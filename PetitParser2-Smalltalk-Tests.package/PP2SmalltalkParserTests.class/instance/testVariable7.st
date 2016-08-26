testing
testVariable7
	super testVariable7.
	PPSmalltalkGrammar allowUnderscoreAssignment
		ifTrue: [ ^ self ].
	self assert: result isVariable.
	self assert: result name equals: '__gen_var_123__'