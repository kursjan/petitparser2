tests
testSeaOptimizationsReset
	| bw aw |
	sea := $a asPParser sea.
	
	parser := sea star.
	self visit: parser.
	bw := sea beforeWater boundary.
	aw := sea afterWater boundary.

	sea parse: '..a..'.
	
	self assert: sea beforeWater boundary ~= bw.
	self assert: sea afterWater boundary ~= aw.