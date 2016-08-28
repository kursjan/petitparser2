testing
testAsPositionableStream
	context := (MinimalStream on: 'foo') asPetit2Stream asPetit2Context.
	context position: 2.

	self should: [ context asPositionableStream ] raise: Exception