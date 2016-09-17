test
testSequence
	| parser |
	parser := $a asPParser , $b asPParser.
	
	self assert: parser parse: 'ab' to: #($a $b).
	
	self assert: parser parse: 'aba' to: #($a $b) end: 2.
	self assert: parser parse: 'abb' to: #($a $b) end: 2.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'a' end: 1.
	self assert: parser fail: 'aa' end: 1.
	self assert: parser fail: 'ba' end: 0.
	self assert: parser fail: 'bab' end: 0