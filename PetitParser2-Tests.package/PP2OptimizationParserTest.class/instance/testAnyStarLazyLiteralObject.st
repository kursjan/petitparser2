tests - seas
testAnyStarLazyLiteralObject
	| parser ctx |
	parser := #any asPParser starLazy, $x asPParser.
	parser optimize.
	parser enableDebug.

	ctx := self assert: parser parse: '..x'.
	self assert: ctx returnValue first asArray equals: #($. $.).
	self assert: ctx debugResult steps equals: 4.
	
	ctx := self assert: parser parse: 'x'.
	self assert: ctx returnValue first isEmpty.
	
	self assert: parser fail: '...'.
	self assert: parser fail: '..a'