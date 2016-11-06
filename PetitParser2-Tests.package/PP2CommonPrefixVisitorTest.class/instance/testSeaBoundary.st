tests
testSeaBoundary
	| sea |
	sea := $a asPParser star trim flatten wrapped sea.
	
	parser := $b asPParser plus trim wrapped flatten.
	sea beforeWater boundaryElements: parser.
	sea afterWater boundary: parser.
	
	self visit: sea.
	self assert: sea beforeWater boundaryElements allSatisfy: [:e | e strategy isKindOf: PP2Cache ].
	self assert: sea afterWater boundaryElements allSatisfy: [:e | e strategy isKindOf: PP2Cache ].	