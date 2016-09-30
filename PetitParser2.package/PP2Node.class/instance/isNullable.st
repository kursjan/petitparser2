analysis - abstract simulation
isNullable
	"
		I return true, if parser ALWAYS can accept epsilon and I NEVER fail.
		
		Use #acceptsEpsilon if it can accept epsilon, but it can fail as well.
	"
	^ self propertyAt: #isNullable ifAbsent: [ 
		PP2IsNullableVisitor new visit: self
	]