test
testTimes
	| parser |
	parser := $a asParser2 times: 2.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'a' end: 1.
	self assert: parser parse: 'aa' to: #($a $a).
	self assert: parser parse: 'aaa' to: #($a $a) end: 2