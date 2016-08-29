optimizations
parents
	^ self propertyAt: #parents ifAbsentPut: [ OrderedCollection new ]