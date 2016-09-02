tests
testCommonPrefix
	| prefixOne prefixTwo |
	prefixOne := #letter asParser2 star wrapped flatten name: 'id'.
	prefixTwo := #letter asParser2 star wrapped flatten name: 'id'.
	
	parser := (prefixOne token trim) / ((prefixTwo, $a asParser2) token trim).
	
	parser optimize.
	
	self assert: prefixOne strategy isKindOf: PP2Cache.
	self assert: prefixTwo strategy isKindOf: PP2Cache.
	
	self assert: prefixOne strategy == prefixTwo strategy.