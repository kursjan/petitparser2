testing-objects
testAnyExceptAnyOf
	| parser |
	parser := PP2PredicateObjectNode noneOf: #($: $,).
	self assertCharacterSets: parser.
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'z' to: $z.
	self assert: parser fail: ':'.
	self assert: parser fail: ','