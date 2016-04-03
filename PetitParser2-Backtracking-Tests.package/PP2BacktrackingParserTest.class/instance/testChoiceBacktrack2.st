as yet unclassified
testChoiceBacktrack2
	| parser |
	parser := ('aa' asParser2 // 'a' asParser2) plus end.
	
	self assert: parser parse: 'aaaa' to: #('aa' 'aa').
	self assert: parser parse: 'aaa' to: #('aa' 'a').
	self assert: parser parse: 'aa' to: #('aa').
	self assert: parser parse: 'a' to: #('a').
	self assert: parser fail: ''.	