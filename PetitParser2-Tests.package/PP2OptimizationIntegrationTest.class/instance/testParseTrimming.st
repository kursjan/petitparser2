tests parsing
testParseTrimming
	parser := $a asParser2 trim optimize.
	
	self assert: (parser parse: '   a   ') isPetit2Success.