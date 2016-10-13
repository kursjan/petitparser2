tests
testMemoMiss
	memoized := $a asPParser plus.
	memoized strategy: (PP2Reparsable on: memoized strategy).
	
	
	parser := (memoized, $b asPParser) / ($a asPParser, memoized).
	parser setOptimized.
	
	context := parser parseWithContext: 'aaa' asReparsableContext.
	
	self assert: context debugResult steps equals: 15.
	self assert: context returnValue size equals: 2.
	self assert: context returnValue first equals: $a.
	self assert: context returnValue second first equals: $a.
	