tests
testIdentifierSmallBuffer
	"Test with stream that provides only atEnd and next:"

	parser := #letter asPParser, #word asPParser plus.
	stream := self streamOn: 'hi123' bufferSize: 1.
	
	self assert: parser parse: stream to: nil end: 5