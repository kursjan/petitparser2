tests
testSequence
	"Test with stream that provides only atEnd and next:"

	parser := $a asPParser, $a asPParser.
	stream := self streamOn: 'aa'.
	
	self assert: parser parse: stream to: #($a $a) end: 2