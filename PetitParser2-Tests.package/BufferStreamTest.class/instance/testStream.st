tests
testStream
	"Test with stream that provides only atEnd and next:"

	parser := $a asParser2, $a asParser2.
	stream := PP2MinimalStream on: 'aa'.
	
	self assert: (parser parse: 'aa') isPetit2Success.