testing-chars
testSpace
	| parser |
	parser := #space asParser.
	self assertCharacterSets: parser.
	self assert: parser parse: (String with: Character tab) to: Character tab.
	self assert: parser parse: ' ' to: Character space.
	self assert: parser fail: ''.
	self assert: parser fail: 'a'