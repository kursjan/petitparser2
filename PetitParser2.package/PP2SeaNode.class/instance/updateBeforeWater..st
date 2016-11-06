boundaries
updateBeforeWater: rootParser
	| next |
	self assert: rootParser isPetit2Parser.

	next := self nextSetIn: rootParser.
	beforeWater	boundaryElements: (OrderedCollection with: island withAll: next).
	