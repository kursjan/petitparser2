tests
testStreamBacktrackBufferSmall
	parser := 'aa' asParser2.
	stream := self streamOn: 'aa' bufferSize: 2.
	
	parser := ('aa' asParser2, 'aa' asParser2) / 'aa' asParser2.
	
	self assert: parser parse: stream to: 'aa' end: 2.
	