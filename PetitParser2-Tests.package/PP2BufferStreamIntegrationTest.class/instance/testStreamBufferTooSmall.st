tests
testStreamBufferTooSmall
	parser := 'aa' asParser2.
	stream := self streamOn: 'aa' bufferSize: 1.
	self should: [ self assert: parser parse: stream to: 'aa' end: 2 ] raise: SubscriptOutOfBounds.	
