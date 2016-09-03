tests - context interface
testCopyFromTo
	| stream |
	stream := self streamOn: 'bar'.

	self assert: (stream copyFrom: 1 to: 1) = 'b'.
	self assert: (stream copyFrom: 1 to: 3) = 'bar'.
