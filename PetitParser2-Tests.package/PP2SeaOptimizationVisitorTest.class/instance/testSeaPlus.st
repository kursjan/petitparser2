tests
testSeaPlus
	sea := $a asPParser sea.
	
	parser := sea plus.
	
	self visit: parser.
	self assert: sea strategy isKindOf: PP2Sea.
	self assert: sea afterWater allNodes noneSatisfy: [ :n | n isSea ]