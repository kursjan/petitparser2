tests
testBacktrackingChoice
	| parser |
	parser := $a asPParser // $b asPParser.
	
	self assert: parser parse: 'a'.
	self assert: parser parse: 'b'.
	self assert: parser fail: 'c'.