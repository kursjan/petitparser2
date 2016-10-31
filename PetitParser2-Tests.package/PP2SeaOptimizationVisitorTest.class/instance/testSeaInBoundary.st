tests
testSeaInBoundary
	parser := $a asPParser sea.
	
	self visit: parser.
	self assert: parser strategy isKindOf: PP2Sea.
	self assert: parser beforeWater boundaryElements noneSatisfy: [ :e | e isSea ].