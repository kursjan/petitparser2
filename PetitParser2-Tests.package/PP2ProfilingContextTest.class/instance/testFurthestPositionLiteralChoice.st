tests
testFurthestPositionLiteralChoice
	| context parser |
	context := 'a' asReparsableContext.
	parser := 'aaa' asPParser / 'a' asPParser.
	parser parseWithContext: context.
	
	self assert: context furthestPosition equals: 3.