tests
testStreamBacktrack
	parser := ('aa' asParser2, 'a' asParser2) / 'aa' asParser2.
	stream := self streamOn: 'aa'.
	
	self assert: parser parse: stream to: 'aa' end: 2.
	