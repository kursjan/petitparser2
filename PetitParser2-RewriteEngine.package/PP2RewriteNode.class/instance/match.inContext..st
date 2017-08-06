matching
match: parseNode inContext: aDictionary
	^ (aDictionary at: self ifAbsentPut: [ parseNode ])
		= parseNode
		and: [ patternToken testBlock value: parseNode ]