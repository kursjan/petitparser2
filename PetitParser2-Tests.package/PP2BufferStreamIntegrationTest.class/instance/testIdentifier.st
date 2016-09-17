tests
testIdentifier
	"Test with stream that provides only atEnd and next:"

	parser := (#letter asPParser, #word asPParser plus) flatten.
	stream := self streamOn: 'hi123'.
	
	self assert: parser parse: 'hi123' to: 'hi123' end: 5.