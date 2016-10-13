as yet unclassified
testFurthestPosition
	context := 'a' asReparsableContext.
	parser := $a asPParser.
	parser parseWithContext: context.
	
	self assert: context furthestPosition equals: 1.