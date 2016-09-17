tests
testAdaptable
	parser := PP2AdaptableNode new.
	parser changeChild: $a asPParser.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: PP2EpsilonNode instance.
	
	1 to: 255 do: [ :index | 
		self assert: firstSet anySatisfy: [ :e | 
			(e parse: (Character codePoint: index) asString) isPetit2Success 
		]
	]
	