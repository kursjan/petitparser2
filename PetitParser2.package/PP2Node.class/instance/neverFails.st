analysis - abstract simulation
neverFails
	"
		I return true, if parser ALWAYS accepts epsilon without a failure.
		
		Use #isNullable if it can accept epsilon, but it can fail as well.
	"
	^ self propertyAt: #neverFails ifAbsentPut: [ 
		PP2NeverFailsVisitor new visit: self
	]