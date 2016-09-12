testing-objects
testExpect
	| parser |
	parser := PP2PredicateObjectNode expect: $a message: '$a expected'.
	self assertCharacterSets: parser.
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'.
	self assert: parser fail: ''