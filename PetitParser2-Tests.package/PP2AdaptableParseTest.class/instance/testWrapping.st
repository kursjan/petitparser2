test
testWrapping
	| parser |
	parser := $a asPParser >=> [:c :cc | cc value].
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'.