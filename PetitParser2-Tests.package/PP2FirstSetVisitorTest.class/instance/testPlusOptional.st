as yet unclassified
testPlusOptional
	| plus |
	parser := $a asParser2.
	"JK: This should actually throw warning somewhere"
	plus := parser optional plus.
	firstSet := self firstSet: plus.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: PP2EpsilonNode instance.
	self assert: firstSet includes: parser.