testing
testOnMessage
	| block parser |
	block := [ :char | char = $* ].
	parser := PPPredicateObjectParser on: block message: 'starlet'.
	self assert: parser block equals: block.
	self assert: parser message equals: 'starlet'.
	self assertCharacterSets: parser.
	self assert: parser parse: '*' to: $*.
	self
		assert: parser
		parse: '**'
		to: $*
		end: 1.
	self assert: parser fail: ''.
	self assert: parser fail: '1'.
	self assert: parser fail: 'a'