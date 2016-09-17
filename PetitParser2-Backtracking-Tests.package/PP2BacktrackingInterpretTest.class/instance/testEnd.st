test
testEnd
	| parser |
	parser := $a asPParser end.

	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: ''.
	self assert: parser fail: 'aa' end: 1.