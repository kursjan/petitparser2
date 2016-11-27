*petitparser2
asPetit2Stream
	^ PP2BufferStream 
		on: self 
		bufferSize: 4*1024