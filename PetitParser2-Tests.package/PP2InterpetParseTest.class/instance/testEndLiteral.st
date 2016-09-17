test
testEndLiteral
	| parser |
	parser := 'stuff' asPParser end.

	self assert: parser parse: 'stuff' to: 'stuff'.
	self assert: parser fail: 'stufff' end: 5.
	self assert: parser fail: 'fluff'