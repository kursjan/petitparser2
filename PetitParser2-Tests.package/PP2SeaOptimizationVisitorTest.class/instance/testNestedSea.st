tests
testNestedSea
	sea := $a asPParser sea.
	
	parser := sea star sea.
	self visit: parser.

	self assert: sea strategy isKindOf: PP2Sea.
	self assert: sea afterWater boundaryElements noneSatisfy: [ :e | e isSea ].
	self assert: sea afterWater boundaryElements anySatisfy: [ :e | e == sea island ]