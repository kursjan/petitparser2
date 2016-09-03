test
testSequence2
	| parser |
	parser := ($a asParser2 , $b asParser2) star, $a asParser2.

	self assert: parser parse: 'a' to: #(#() $a).

	self assert: parser fail: 'ab' end: 2.
	self assert: parser fail: ''.