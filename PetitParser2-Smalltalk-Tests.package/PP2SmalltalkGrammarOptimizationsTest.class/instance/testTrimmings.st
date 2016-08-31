tests
testTrimmings
	| trimmings |
	parser := PP2SmalltalkGrammar new optimize.
	trimmings := parser allChildren select: [ :node | node isTrimming ].
	
	trimmings do: [ :c |
		self assert: c trimmer strategy isKindOf: PP2TrimmingGuard 
	]