tests
testStreamBacktrackBufferSmall
	parser := 'aa' asPParser.
	stream := self streamOn: 'aa' bufferSize: 2.
	
	parser := ('aa' asPParser, 'aa' asPParser) / 'aa' asPParser.
	
	self assert: parser parse: stream to: 'aa' end: 2.
	