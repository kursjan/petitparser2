tests
testMemoHit
	| debugResult |
	memoized := $a asPParser plus.
	memoized strategy: (PP2Memoized on: memoized strategy).
	
	parser := (memoized, $b asPParser) / (memoized, $c asPParser).
	
	context := parser enableDebug parseContext: 'aac'.
	
	debugResult := context debugResult.
	self assert: debugResult allResults size equals: 11.
	self assert: context returnValue size equals: 2.
	self assert: context returnValue first size equals: 2.
	self assert: context returnValue first first equals: $a.
	self assert: context returnValue second equals: $c.
