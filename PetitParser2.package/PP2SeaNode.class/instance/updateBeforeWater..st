boundaries
updateBeforeWater: rootParser
	| next elements |
	self assert: rootParser isPetit2Parser.

	next := self nextSetIn: rootParser.
	elements := OrderedCollection with: island.
	elements addAll: next.
	beforeWater	boundaryElements: elements.
	