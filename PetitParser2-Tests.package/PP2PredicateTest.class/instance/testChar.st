testing-chars
testChar
	| parser |
	parser := $* asPParser.
	self assertCharacterSets: parser.
	self assert: parser parse: '*' to: $*.
	self assert: parser parse: '**' to: $* end: 1.
	self assert: parser fail: ''.
	self assert: parser fail: '1'.
	self assert: parser fail: 'a'