private
uncheckedNext
	| bufferIndex |
	bufferIndex := (position % bufferSize) + 1.
	position := position + 1.
	
	buffer at: bufferIndex put: stream next.
	^ buffer at: bufferIndex