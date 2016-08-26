tests
testStreamIdentifier
	"Test with stream that provides only atEnd and next:"

	parser := (#letter asParser2, #word asParser2 plus) flatten.
	stream := MinimalStream on: 'hi123'.
	
	self assert: (result := parser parse: 'hi123') isPetit2Success.
	self assert: result value equals: 'hi123'