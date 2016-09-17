tests
testIdentifierSmallBufferError
	"Test with stream that provides only atEnd and next:"

	parser := (#letter asPParser, #word asPParser plus) flatten.
	stream := self streamOn: 'hi123' bufferSize: 1.
	
	self should: [ self assert: parser parse: stream to: 'hi123' end: 5 ] raise: SubscriptOutOfBounds 