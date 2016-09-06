tests
testVariable
	| variable |
	parser := PP2SmalltalkGrammar new optimize.
	
	variable := parser allNodes detect: [:e | e name = 'variable' ].
	self assert: (variable strategies anySatisfy: [ :s | s isKindOf: PP2Cache ])