tests
testAnyStarLazyLiteralObject
	| starLazy literal |
	starLazy := #any asPParser starLazy.
	literal := $a asPParser.
	parser := starLazy, literal.
	
	starLazy child updateAfterWater: parser.
	starLazy child updateBeforeWater: parser.
		
	visitor visit: parser.
	self assert: starLazy strategy isKindOf: PP2AnyStarLazyLiteralObject.
	self assert: starLazy strategy literal equals: literal literal.