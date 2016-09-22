test
testMapWrappedSequence
	| parser |
	parser := (#any asPParser, #any asPParser) wrapped
		map: [ :a :b | Array with: b with: a ].

	self assert: parser parse: 'ab' to: #($b $a)