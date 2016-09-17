testing-chars
testNewline
	| parser |
	parser := #newline asPParser.

	self assert: parser parse: String cr to: String cr.
	self assert: parser parse: String lf to: String lf.
	self assert: parser parse: String crlf to: String  crlf.
	self assert: parser fail: ' '