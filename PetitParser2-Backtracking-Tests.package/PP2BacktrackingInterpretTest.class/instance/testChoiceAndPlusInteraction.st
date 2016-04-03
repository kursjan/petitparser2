tests
testChoiceAndPlusInteraction
	| parser |
	parser := ($a asParser2 // $b asParser2) plus end.
	
	self assert: parser parse: 'aaa' to: #($a $a $a).
	self assert: parser parse: 'bbb' to: #($b $b $b).
	self assert: parser parse: 'abab' to: #($a $b $a $b).
	self assert: parser fail: ''.	