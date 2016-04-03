as yet unclassified
testStreamBufferSmall
	parser := 'aa' asParser2.
	stream := MinimalStream on: 'aa'.
	
	result := (parser parse: (PP2BufferStream on: stream bufferSize: 2)).
	self assert: result isPetit2Success.
	self assert: result retval = 'aa'.