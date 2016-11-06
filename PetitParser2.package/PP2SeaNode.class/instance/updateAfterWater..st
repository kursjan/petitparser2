boundaries
updateAfterWater: rootParser
	| next |
	self assert: rootParser isPetit2Parser.
	
	next := self nextSetIn: rootParser.
	afterWater boundaryElements: (OrderedCollection withAll: next)
