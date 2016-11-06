tests
testSeaNested
	| sea |
	sea := $a asPParser sea.
	
	parser := (sea ==> #second) sea.
	sea beforeWater boundary: $b asPParser plus flatten trim.
	sea afterWater boundary: $c asPParser plus flatten trim.
	self visit: parser.
	
	self assert: sea beforeWater boundaryElements allSatisfy: [ :e | e strategy isKindOf: PP2Cache ].
	self assert: sea afterWater boundaryElements allSatisfy: [ :e | e strategy isKindOf: PP2Cache ].	