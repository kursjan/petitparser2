tests
testIdentifierSmallBuffer
	"Test with stream that provides only atEnd and next:"

	parser := #letter asParser2, #word asParser2 plus.
	stream := self streamOn: 'hi123' bufferSize: 1.
	
	self assert: parser parse: stream to: nil end: 5