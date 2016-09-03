test
testPlus2
	| parser |
	parser := ($a asParser2, $b asParser2) plus.
	
	self assert: parser parse: 'ab' to: #(#($a $b)).
	self assert: parser fail: 'a' end: 1.