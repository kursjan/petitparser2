tests
testKeywordMessageCache
	| message identifiers strategy |
	parser := PP2SmalltalkGrammar new optimize.
	message := parser allChildren detect: [ :node | node name = 'message' ].
	
	identifiers := message firstProductionSet select: [ :node | node name = 'identifier' ].
	strategy := identifiers anyOne strategy.
	
	self assert: strategy isKindOf: PP2Cache.
	self assert: identifiers allSatisfy: [ :id | id strategy == strategy ]