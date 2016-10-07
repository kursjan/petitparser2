tests
testSeaStar
	sea := $a asPParser sea.
	
	parser := sea star.
	
	self visit: parser.
	self assert: sea strategy isKindOf: PP2Sea.
	self assert: sea afterWater allNodes noneSatisfy: [ :n | n isSea ]