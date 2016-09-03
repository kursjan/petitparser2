tests
testKeywordMessageCache
	| message identifiers strategy |
	parser := PP2SmalltalkGrammar new optimize.
	message := parser allNodes detect: [ :node | node name = 'message' ].
	
	identifiers := message firstProductionSet select: [ :node | node name = 'identifier' ].
	strategy := identifiers anyOne strategy.
	
	identifiers do: [ :identifier |
		self assert: identifier strategies anySatisfy: [ :s | s isKindOf: PP2Cache].
	].
	self assert: identifiers allSatisfy: [ :id | id strategy == strategy ]