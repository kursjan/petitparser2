tests
testAnyStarLazyLiteralObject
	parser := #any asPParser starLazy, $a asPParser.
	
	parser optimize.
	
	self assert: parser firstChild strategy isKindOf: PP2AnyStarLazyLiteralObject.