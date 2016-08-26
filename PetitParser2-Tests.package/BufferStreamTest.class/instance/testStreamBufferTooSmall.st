tests
testStreamBufferTooSmall
	parser := 'aa' asParser2.
	stream := MinimalStream on: #($a $a).
	self should: [ parser parse: (PP2BufferStream on: stream bufferSize: 1) ] raise: Error.		


	parser := 'aaa' asParser2.
	stream := MinimalStream on: #($a $a $a).
	
	self should: [ parser parse: (PP2BufferStream on: stream bufferSize: 1) ] raise: Error.		
	
