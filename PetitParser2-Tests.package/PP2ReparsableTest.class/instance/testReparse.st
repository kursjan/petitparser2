tests
testReparse
	| startContext |
	parser := $a asPParser plus.
	parser strategy: (PP2Reparsable on: parser strategy).
	parser setOptimized.
	parser enableDebug.
	
	startContext := 'aa' asReparsableContext.
	
	context := parser parseWithContext: startContext.
	self assert: context debugResult steps equals: 5.
	
	context := parser reparseWithContext: context.
	self assert: context debugResult steps equals: 2.