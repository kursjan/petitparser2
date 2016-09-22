test
testTrim
	| parser |
	parser := 'a' asPParser trim.
	
	self assert: parser parse: 'a' to: 'a'.
	self assert: parser parse: ' a' to: 'a'.
	self assert: parser parse: 'a ' to: 'a' end: 2.
	self assert: parser parse: ' a ' to: 'a' end: 3.
	self assert: parser parse: '  a  ' to: 'a' end: 5.

	self assert: parser fail: 'b'.
