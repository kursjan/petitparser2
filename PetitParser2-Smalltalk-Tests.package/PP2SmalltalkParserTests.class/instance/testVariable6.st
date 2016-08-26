testing
testVariable6
	super testVariable6.
	PPSmalltalkGrammar allowUnderscoreAssignment
		ifTrue: [ ^ self ].
	self assert: result isVariable.
	self assert: result name equals: 'super_nanny'