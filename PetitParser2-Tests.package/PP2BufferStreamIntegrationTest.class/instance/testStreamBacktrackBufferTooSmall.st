tests
testStreamBacktrackBufferTooSmall
	parser := 'aa' asPParser.
	stream := self streamOn: 'aa' bufferSize: 1.
	
	parser := ('aa' asPParser, 'aa' asPParser) / 'aa' asPParser.
	
	self should: [ self assert: parser parse: stream to: 'aa' end: 2 ] raise: SubscriptOutOfBounds 
	