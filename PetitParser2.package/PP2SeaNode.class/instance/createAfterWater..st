boundaries
createAfterWater: context
	| next |
	next := self nextSetIn: context parser.
	^ (PP2WaterNode new)
		waterToken: self waterToken;
		boundary: (self boundaryFrom: (OrderedCollection withAll: next)).
	