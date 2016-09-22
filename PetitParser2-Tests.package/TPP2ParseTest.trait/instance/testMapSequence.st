test
testMapSequence
	| parser |
	parser := #any asPParser, #any asPParser
		map: [ :a :b | Array with: b with: a ].

	self assert: parser parse: 'ab' to: #($b $a)