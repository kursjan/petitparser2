testing-sequence
testSequenceParser
	| parser |
	parser := PP2PredicateSequenceNode
		on: [ :value | value first isUppercase ]
		message: 'uppercase 3 letter words'
		size: 3.
	self assert: parser size equals: 3.
	self assert: parser parse: 'Abc'.
	self assert: parser parse: 'ABc'.
	self assert: parser parse: 'ABC'.
	self assert: parser fail: 'abc'.
	self assert: parser fail: 'aBC'.
	self assert: parser fail: 'Ab'.
	parser := parser negate.
	self assert: parser size equals: 3.
	self assert: parser fail: 'Abc'.
	self assert: parser fail: 'ABc'.
	self assert: parser fail: 'ABC'.
	self assert: parser parse: 'abc'.
	self assert: parser parse: 'aBC'.
	self assert: parser fail: 'Ab'