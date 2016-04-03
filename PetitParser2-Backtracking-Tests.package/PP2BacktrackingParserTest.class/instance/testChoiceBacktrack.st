as yet unclassified
testChoiceBacktrack
	| parser |
	parser := ('aa' asParser2 // 'a' asParser2), $a asParser2.
	
	self assert: parser parse: 'aaaa' to: #('aa' $a) end: 3.
	self assert: parser parse: 'aaa' to: #('aa' $a).
	self assert: parser parse: 'aa' to: #('a' $a).
	self assert: parser fail: 'a'.