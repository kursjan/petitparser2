test - parsing
testEnd
	| parser |
	parser := $a asParser2 end.

	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: ''.
	self assert: parser fail: 'aa' end: 1.