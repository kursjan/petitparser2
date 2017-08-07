matching
match: parseNode inContext: aDictionary
	^ parseNode isToken
		and: [ (aDictionary at: self ifAbsentPut: [ parseNode ]) = parseNode
				and: [ self testBlock value: parseNode ] ]