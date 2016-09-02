tests
testCaches

	| cached |
	parser := PP2SmalltalkGrammar new optimize.
	cached := parser allChildren select: [ :child |
		child strategies anySatisfy: [ :s | s isKindOf:PP2Cache ]
	].

	self assert: cached size = 1.