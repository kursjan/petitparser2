tests
testStreamBacktrackBufferTooSmall
	parser := ('a' asParser2, 'a' asParser2, 'a' asParser2) / 'aa' asParser2.
	stream := PP2MinimalStream on: #($a $a).
	
	self should: [parser parse: (PP2BufferStream on: stream bufferSize: 1)] raise: Error.		
	