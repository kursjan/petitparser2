tests
testWrappingNonFunctional
	| literal |
	literal := $a asParser2.
	parser := literal >==> [:c :cc | cc value].
	firstSet := self firstSet: parser.

	"JK: Not sure if it should contain epsilon or not"
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: literal.