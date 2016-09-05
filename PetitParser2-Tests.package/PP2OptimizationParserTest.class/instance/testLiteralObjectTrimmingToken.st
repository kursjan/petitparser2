tests
testLiteralObjectTrimmingToken
	
	self assert: $a asParser2 wrapped token trim parse: '   a   ' toTokenValue: 'a'.