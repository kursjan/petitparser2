tests
testLiteral
	| literal |
	parser := PP2SmalltalkGrammar new optimize.
	literal := parser allNodes detect: [ :node | node name = 'literal' ].
	
	literal child children do: [ :c |
		self assert: c strategy isKindOf: PP2ParsingGuard 
	]