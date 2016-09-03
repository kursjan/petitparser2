tests
testPredicate
	"Test with stream that provides only atEnd and next:"

	parser := #letter asParser2.
	stream := PP2BufferStream on: (PP2MinimalStream on: 'a').
	
	self assert: (result := parser parse: stream) isPetit2Success.
	self assert: result value equals: $a.