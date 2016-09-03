tests
testPredicate
	"Test with stream that provides only atEnd and next:"

	parser := #letter asParser2.
	stream := self streamOn: 'a'.
	
	self assert: parser parse: stream to: $a end: 1.