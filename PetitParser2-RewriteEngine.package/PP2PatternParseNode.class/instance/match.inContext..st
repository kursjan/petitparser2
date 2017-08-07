matching
match: parseNode inContext: aDictionary
	self halt.
	^ (aDictionary at: self ifAbsentPut: [ parseNode ])
		= parseNode
		and: [ patternToken testBlock value: parseNode ]