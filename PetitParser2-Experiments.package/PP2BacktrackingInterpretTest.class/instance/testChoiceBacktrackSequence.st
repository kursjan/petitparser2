tests
testChoiceBacktrackSequence
	| parser |
	parser := ('aa' asPParser // 'a' asPParser), $a asPParser.
	
	self assert: parser parse: 'aaaa' to: #('aa' $a) end: 3.
	self assert: parser parse: 'aaa' to: #('aa' $a).
	self assert: parser parse: 'aa' to: #('a' $a).
	self assert: parser fail: 'a'.