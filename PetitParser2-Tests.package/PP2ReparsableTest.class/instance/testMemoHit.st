tests
testMemoHit
	memoized := $a asPParser plus.
	memoized strategy: (PP2Reparsable on: memoized strategy).
	
	parser := (memoized, $b asPParser) / (memoized, $c asPParser).
	parser setOptimized.
	
	context := parser parseWithContext: 'aac' asReparsableContext.
	
	self assert: context debugResult allResults size equals: 11.
	self assert: context returnValue size equals: 2.
	self assert: context returnValue first size equals: 2.
	self assert: context returnValue first first equals: $a.
	self assert: context returnValue second equals: $c.
