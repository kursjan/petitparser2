test - conversion
testPPMemoizedParserConversion
	| converted parser |

	parser := nil asParser memoized.
		
	converted := parser asPetit2Node.
	self assert: (converted isKindOf: PP2MemoizingParser).