testing-chars
testDigit
	| parser |
	parser := #digit asParser.
	self assertCharacterSets: parser.
	self assert: parser parse: '0' to: $0.
	self assert: parser parse: '9' to: $9.
	self assert: parser fail: ''.
	self assert: parser fail: 'a'