tests
testMemoMiss
	| debugResult |
	memoized := $a asPParser plus.
	memoized strategy: (PP2Memoized on: memoized strategy).
	
	parser := (memoized, $b asPParser) / ($a asPParser, memoized).
	
	context := parser optimize enableDebug parseContext: 'aaa'.
	
	debugResult := context debugResult.
	self assert: debugResult allResults size equals: 15.

	self assert: context returnValue size equals: 2.
	self assert: context returnValue first equals: $a.
	self assert: context returnValue second first equals: $a.
	