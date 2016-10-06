tests
testMemoizedSea
	sea := $a asPParser sea.
	
	parser := sea, ($a asPParser / sea).
	
	self visit: parser.
	self assert: sea strategy isKindOf: PP2MemoizedSea.
	self assert: sea afterWater allNodes anySatisfy: [ :n | n isSea ]