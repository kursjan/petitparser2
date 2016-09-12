testing-objects
testBetweenAnd
	| parser |
	parser := PP2PredicateObjectNode between: $b and: $d.
	self assertCharacterSets: parser.
	self assert: parser fail: 'a'.
	self assert: parser parse: 'b' to: $b.
	self assert: parser parse: 'c' to: $c.
	self assert: parser parse: 'd' to: $d.
	self assert: parser fail: 'e'