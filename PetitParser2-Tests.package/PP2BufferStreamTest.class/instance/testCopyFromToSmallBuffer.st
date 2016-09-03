tests
testCopyFromToSmallBuffer
	| stream |
	stream :=  self streamOn: 'foobar' bufferSize: 3. 

	self assert: (stream copyFrom: 1 to: 3) = 'foo'.
	self assert: (stream copyFrom: 2 to: 4) = 'oob'.

	self should: [ stream copyFrom: 1 to: 3 ] raise: Exception description: 'too much backtrack'.
	self should: [ stream copyFrom: 2 to: 5 ] raise: Exception description: 'range too big'.
