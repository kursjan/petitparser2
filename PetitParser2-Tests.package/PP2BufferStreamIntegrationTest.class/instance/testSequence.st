tests
testSequence
	"Test with stream that provides only atEnd and next:"

	parser := $a asParser2, $a asParser2.
	stream := self streamOn: 'aa'.
	
	self assert: parser parse: stream to: #($a $a) end: 2