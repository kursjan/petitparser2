test
testPlus2
	| parser |
	parser := ($a asPParser, $b asPParser) plus.
	
	self assert: parser parse: 'ab' to: #(#($a $b)).
	self assert: parser fail: 'a' end: 1.