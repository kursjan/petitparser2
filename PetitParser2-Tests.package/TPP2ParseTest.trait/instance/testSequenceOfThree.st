test
testSequenceOfThree
	| parser |
	parser := $a asPParser , $b asPParser, $c asPParser.
	
	self assert: parser parse: 'abc' to: #($a $b $c).
	self assert: parser fail: 'ab' end: 2.