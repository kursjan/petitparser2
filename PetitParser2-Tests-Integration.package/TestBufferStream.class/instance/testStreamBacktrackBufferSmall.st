as yet unclassified
testStreamBacktrackBufferSmall
	| result stream |
	parser := 'aa' asParser2.
	stream := MinimalStream on: #($a $a).
	
	parser := ('aa' asParser2, 'aa' asParser2) / 'aa' asParser2.
	result := (parser parse: (PP2BufferStream on: stream bufferSize: 2)).
	self assert: result isPetit2Success.
	self assert: result retval = 'aa'.
	