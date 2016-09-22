test
testSequence2
	| parser |
	parser := ($a asPParser , $b asPParser) star, $a asPParser.

	self assert: parser parse: 'a' to: (Array with: OrderedCollection new with: $a).

	self assert: parser fail: 'ab' end: 2.
	self assert: parser fail: ''.