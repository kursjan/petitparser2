tests
testStreamBacktrack
	parser := ('aa' asPParser, 'a' asPParser) / 'aa' asPParser.
	stream := self streamOn: 'aa'.
	
	self assert: parser parse: stream to: 'aa' end: 2.
	