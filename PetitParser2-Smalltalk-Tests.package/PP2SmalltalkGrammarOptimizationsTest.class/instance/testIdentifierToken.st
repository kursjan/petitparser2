tests
testIdentifierToken
	| sequence |
	parser := PP2SmalltalkGrammar new identifierToken optimize.
	
	sequence := parser child child child.
	self assert: (sequence strategies anySatisfy: [ :s | s isKindOf: PP2SequenceOfTwoRecognizer ]).
	self assert: sequence firstChild strategy isKindOf: PP2PredicateObjectRecognizer.
	self assert: sequence secondChild strategy isKindOf: PP2StarPredicateObjectRecognizer.