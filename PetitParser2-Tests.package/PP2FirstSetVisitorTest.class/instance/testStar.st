tests
testStar
	| star |
	parser := $a asPParser.
	star := parser star.
	firstSet := self firstSet: star.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: PP2EpsilonNode instance