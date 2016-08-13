tests
testSequenceOfThree
	| parser |
	parser := $a asParser2 , $b asParser2, $c asParser2.
	
	self assert: parser parse: 'abc' to: #($a $b $c).
	self assert: parser fail: 'ab'.