test
testLiteralObjectCaseInsensitive
	| parser |
	parser := $a asPParser caseInsensitive.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'A' to: $A.

	self assert: parser fail: ''.
	self assert: parser fail: 'b'.
	self assert: parser fail: 'B'
	