as yet unclassified
testStreamBufferSmall
	| result stream |
	parser := 'aa' asParser2.
	stream := MinimalStream on: 'aa'.
	
	result := (parser parse: (PP2BufferStream on: stream bufferSize: 2)).
	self assert: result isPetit2Success.
	self assert: result retval = 'aa'.