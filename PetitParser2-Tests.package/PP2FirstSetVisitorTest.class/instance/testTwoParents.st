tests
testTwoParents
	| sequence |
	parser := $a asPParser.
	sequence := parser star, parser star.
	
	firstSet := self firstSet: sequence.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: PP2EpsilonNode instance.
	self assert: firstSet includes: parser.
