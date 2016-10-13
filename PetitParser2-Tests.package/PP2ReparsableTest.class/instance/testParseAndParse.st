tests
testParseAndParse
	parser := $a asPParser plus.
	parser strategy: (PP2Reparsable on: parser strategy).
	parser setOptimized.
	parser enableDebug.
	
	context := parser parseWithContext: 'aa' asReparsableContext.
	self assert: context debugResult steps equals: 5.
	
	context := parser parseWithContext: context asReparsableContext.
	self assert: context debugResult steps equals: 5.