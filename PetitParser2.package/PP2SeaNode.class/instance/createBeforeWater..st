boundaries
createBeforeWater: context
	| next |
	self halt: 'depr'.
	next := self nextSetIn: context parser.
	^ (PP2WaterNode new)
		waterToken: self waterToken;
		boundary: (self boundaryFrom: (OrderedCollection with: island withAll: next)).
	