test
testChoice
	| parser |
	parser := $a asPParser / $b asPParser.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'b' to: $b.

	self assert: parser parse: 'ab' to: $a end: 1.
	self assert: parser parse: 'ba' to: $b end: 1.

	self assert: parser fail: ''.
	self assert: parser fail: 'c'.
	self assert: parser fail: 'ca'