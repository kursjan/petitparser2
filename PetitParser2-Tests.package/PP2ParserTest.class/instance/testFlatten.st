test - parsing (deprecated)
testFlatten
	| parser |
	parser := $a asParser2 flatten.
	
	self assert: parser parse: 'a' to: 'a'.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'b'