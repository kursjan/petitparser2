tests
testInvocations
	| cachedParser parser result |
	cachedParser := $a asPParser star.
	cachedParser strategy: cachedParser strategy cache recording.
	
	parser := cachedParser and, cachedParser.
	
	result := parser parse: 'aaa' withContext: PP2RecordingContext new.
	
	self assert: result isPetit2Success.
	self assert: cachedParser strategy invocations equals: 2.
	self assert: cachedParser strategy hits equals: 1.
	
