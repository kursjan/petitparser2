tests
testPredicate
	"Test with stream that provides only atEnd and next:"

	parser := #letter asPParser.
	stream := self streamOn: 'a'.
	
	self assert: parser parse: stream to: $a end: 1.