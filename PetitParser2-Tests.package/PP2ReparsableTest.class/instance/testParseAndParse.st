tests
testParseAndParse
	parser := $a asPParser plus.
	parser strategy: (PP2Reparsable on: parser strategy).
	parser setOptimized.
	
	context := parser parseContext: 'aa'.
	
	self assert: context debugResult steps equals: 5.
	
	context := parser parseContext: 'aa'.
	self assert: context debugResult steps equals: 5.