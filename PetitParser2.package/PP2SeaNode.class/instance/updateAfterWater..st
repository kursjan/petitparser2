boundaries
updateAfterWater: rootParser
	| next |
	self assert: rootParser isPetit2Parser.
	
	next := self nextSetIn: rootParser.
	afterWater boundary: (self boundaryFrom: (OrderedCollection withAll: next))