testing-chars
testPunctuation
	| parser |
	parser := #punctuation asParser.
	self assertCharacterSets: parser.
	self assert: parser parse: '.' to: $..
	self assert: parser parse: ',' to: $,.
	self assert: parser fail: ''.
	self assert: parser fail: 'a'.
	self assert: parser fail: '1'