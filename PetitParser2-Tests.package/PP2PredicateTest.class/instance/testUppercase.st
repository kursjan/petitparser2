testing-chars
testUppercase
	| parser |
	parser := #uppercase asParser.
	self assertCharacterSets: parser.
	self assert: parser parse: 'A' to: $A.
	self assert: parser parse: 'Z' to: $Z.
	self assert: parser fail: ''.
	self assert: parser fail: 'a'.
	self assert: parser fail: '0'