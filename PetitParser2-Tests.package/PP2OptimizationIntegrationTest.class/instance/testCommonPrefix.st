tests
testCommonPrefix
	| prefixOne prefixTwo |
	prefixOne := #letter asPParser star wrapped flatten name: 'id'.
	prefixTwo := #letter asPParser star wrapped flatten name: 'id'.
	
	parser := (prefixOne token trim) / ((prefixTwo, $a asPParser) token trim).
	
	parser optimize.
	
	self assert: prefixOne strategy isKindOf: PP2Cache.
	self assert: prefixTwo strategy isKindOf: PP2Cache.
	
	self assert: prefixOne strategy == prefixTwo strategy.