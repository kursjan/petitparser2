as yet unclassified
testChoiceBacktrack3
	| parser |
	parser := ('aa' asParser2 // 'a' asParser2), $b asParser2 optional.
	
	self assert: parser parse: 'aab'.
	self assert: parser parse: 'ab'.
	self assert: parser parse: 'aa'.
	self assert: parser parse: 'a'.
	self assert: parser fail: 'b'.