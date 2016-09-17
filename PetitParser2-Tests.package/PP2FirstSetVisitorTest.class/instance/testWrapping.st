tests
testWrapping
	parser := $a asPParser >=> [:c :cc | cc value].
	firstSet := self firstSet: parser.

	"JK: Not sure if it should contain epsilon or not"
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.