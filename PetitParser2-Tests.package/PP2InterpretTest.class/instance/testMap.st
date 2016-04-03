tests
testMap
	| parser |
	parser := #any asParser2
		map: [ :a | Array with: a ].

	self assert: parser parse: 'a' to: #($a).

	self assert: parser fail: ''.