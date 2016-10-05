tests
testCaches

	| cached |
	parser := PP2SmalltalkGrammar new optimize.
	cached := parser allNodes select: [ :child |
		child strategies anySatisfy: [ :s | s isKindOf:PP2Cache ]
	].

	self assert: cached size equals: 3.

	self assert: cached anySatisfy: [:n | n name = #identifierToken].
	self assert: cached anySatisfy: [:n | n name = #variable].
		
	self flag: 'JK: I would like to remove this case'.
	self assert: cached anySatisfy: [:n | n name = #identifier].