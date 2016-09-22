test
testMap
	| parser |
	parser := #any asPParser
		map: [ :a | Array with: a ].

	self assert: parser parse: 'a' to: #($a).

	self assert: parser fail: ''.