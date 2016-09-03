tests
testAsPositionableStream
	| context |
	context := (PP2MinimalStream on: 'foo') asPetit2Stream asPetit2Context.
	context position: 2.

	self should: [ context asPositionableStream ] raise: Exception