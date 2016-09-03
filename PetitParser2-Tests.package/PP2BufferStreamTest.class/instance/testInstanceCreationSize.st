tests
testInstanceCreationSize
	| stream |
	stream := self streamOn: '' bufferSize: 2. 
	self assert: (stream buffer isKindOf: String).
	self assert: (stream buffer size = stream bufferSize).
	self assert: (stream bufferSize = 2).
