boundaries
updateBeforeWater: rootParser
	| next |
	self assert: rootParser isPetit2Parser.

	next := self nextSetIn: rootParser.
	beforeWater	boundary: (self boundaryFrom: (OrderedCollection with: island withAll: next)).
	