tests
testInstanceCreation
	| stream |
	stream := self streamOn: ''.
	self assert: (stream buffer isKindOf: String).
	self assert: (stream buffer size = stream bufferSize).
