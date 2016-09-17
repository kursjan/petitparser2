test - operators
testDelimitedBy
	| parser |
	parser := $a asPParser delimitedBy: $b asPParser.
	
	self assert: parser parse: 'a' to: #($a).
	self assert: parser parse: 'aba' to: #($a $b $a).
	self assert: parser parse: 'ababa' to: #($a $b $a $b $a).

	self assert: parser parse: 'ab' to: #($a $b).
	self assert: parser parse: 'abab' to: #($a $b $a $b).
	self assert: parser parse: 'ababab' to: #($a $b $a $b $a $b).
	
	self assert: parser parse: 'ac' to: #($a) end: 1.
	self assert: parser parse: 'abc' to: #($a $b) end: 2.
	self assert: parser parse: 'abac' to: #($a $b $a) end: 3.
	self assert: parser parse: 'ababc' to: #($a $b $a $b) end: 4.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'b'.
	self assert: parser fail: 'c'