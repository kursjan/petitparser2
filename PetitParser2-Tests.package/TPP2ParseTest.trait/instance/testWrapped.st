test
testWrapped
	| parser |
	parser := $a asPParser wrapped.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'.