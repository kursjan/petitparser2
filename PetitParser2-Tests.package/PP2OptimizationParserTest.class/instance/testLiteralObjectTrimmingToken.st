tests
testLiteralObjectTrimmingToken
	
	self assert: $a asPParser wrapped token trim parse: '   a   ' toTokenValue: 'a'.