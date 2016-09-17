test
testOptional
	| parser |
	parser := $a asPParser optional.
	
	self assert: parser parse: '' to: nil.
	self assert: parser parse: 'a' to: $a.
	
	self assert: parser parse: 'aa' to: $a end: 1.
	self assert: parser parse: 'ab' to: $a end: 1.
	self assert: parser parse: 'b' to: nil end: 0.
	self assert: parser parse: 'bb' to: nil end: 0.
	self assert: parser parse: 'ba' to: nil end: 0