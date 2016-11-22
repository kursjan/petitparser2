tests
testFurthestPosition
	| context parser |
	context := 'a' asReparsableContext.
	parser := $a asPParser.
	parser parseWithContext: context.
	
	self assert: context furthestPosition equals: 1.