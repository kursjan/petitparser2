tests
testWrapped
	| parser |
	parser := $a asParser2 wrapped.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'.