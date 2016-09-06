tests
testPluggable
	parser := [:ctx | ctx next] asParser2.
	firstSet := self firstSet: parser.

	"JK: Not sure if it should contain epsilon or not"
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.