tests - converting
testAsPositionableStream
	| stream context |
	
	context := 'bar' asPetit2Stream asPetit2Context.
	context position: 2.

	stream := context asPositionableStream.
	
	self assert: (stream isKindOf: PositionableStream).
	self assert: stream position equals: 2.
	self assert: stream peek equals: $r.