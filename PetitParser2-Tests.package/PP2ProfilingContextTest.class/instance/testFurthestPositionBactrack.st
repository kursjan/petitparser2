tests
testFurthestPositionBactrack
	| parser context |
	parser := 'a' asPParser star, 'b' asPParser.
	context := parser parseWithContext: 'aaaac' asReparsableContext.

	self assert: context furthestPosition equals: 5.