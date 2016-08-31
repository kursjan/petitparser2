tests
testNumbeToken
	| sequences |
	parser := PP2SmalltalkGrammar new numberToken optimize.
	
	sequences := parser allChildren select: [ :e | (e isKindOf: PP2SequenceNode) and: [ e children size = 2 ]  ].
	self assert: sequences allSatisfy: [ :e | e strategy isKindOf: PP2SequenceOfTwoRecognizer  ].