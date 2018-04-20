tests
testChoiceBacktrackSequenceWithOptional
	| parser |
	parser := ('aa' asPParser // 'a' asPParser), $b asPParser optional.
	
	self assert: parser parse: 'aab'.
	self assert: parser parse: 'ab'.
	self assert: parser parse: 'aa'.
	self assert: parser parse: 'a'.
	self assert: parser fail: 'b'.