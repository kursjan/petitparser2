analysis - abstract simulation
acceptsEpsilon
	^ self propertyAt: #acceptsEpsilon ifAbsentPut: [ 
		PP2AcceptsEpsilonVisitor new visit: self
	]