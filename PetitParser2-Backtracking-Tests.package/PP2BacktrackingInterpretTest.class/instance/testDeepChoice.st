tests
testDeepChoice
	| parser1 parser2 parser |
	
	parser1 := $a asPParser // $b asPParser.
	parser2 := $c asPParser // $d asPParser.
	parser := parser1 // parser2.
	
	self assert: parser parse: 'a'.
	self assert: parser parse: 'b'.
	self assert: parser parse: 'c'.
	self assert: parser parse: 'd'.
	self assert: parser fail: 'e'.