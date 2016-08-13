tests
testStreamBacktrack
	parser := 'aa' asParser2, 'a' asParser2 / 'aa' asParser2.
	stream := PP2BufferStream on: (MinimalStream on: 'aa').
	
	self assert: (parser parse: stream) isPetit2Success.		
	