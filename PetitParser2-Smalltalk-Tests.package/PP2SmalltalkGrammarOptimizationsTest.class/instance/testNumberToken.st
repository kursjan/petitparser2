tests
testNumberToken
	| sequences |
	parser := PP2SmalltalkGrammar new numberToken optimize.
	
	sequences := parser allNodes select: [ :e | (e isKindOf: PP2SequenceNode) and: [ e children size = 2 ]  ].
	self assert: sequences allSatisfy: [ :e | e strategies anySatisfy: [:s | s isKindOf: PP2SequenceOfTwoRecognizer ] ].