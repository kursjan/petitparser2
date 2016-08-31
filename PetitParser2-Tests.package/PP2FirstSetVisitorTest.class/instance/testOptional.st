tests
testOptional
	| optional |
	parser := $a asParser2.
	optional := parser optional.
	firstSet := self firstSet: optional.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: PP2EpsilonNode instance.
	self assert: firstSet includes: parser.