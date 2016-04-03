test - parsing
testEnd2
	| parser |
	parser := 'stuff' asParser2 end.

	self assert: parser parse: 'stuff' to: 'stuff'.
	self assert: parser fail: 'stufff' end: 5.
	self assert: parser fail: 'fluff'