tests
testReparse
	| debugResult |
	parser := $a asPParser plus.
	parser strategy: (PP2Memoized on: parser strategy).
	parser setOptimized.
	
	context := parser enableDebug parseContext: 'aa'.
	
	debugResult := context debugResult.
	self assert: debugResult allResults size equals: 5.
	
	context := parser enableDebug reparseContext: 'aa'.
	debugResult := context debugResult.
	self assert: debugResult allResults size equals: 2.