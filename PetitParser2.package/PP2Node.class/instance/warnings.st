optimizations - warnings
warnings
	^ self propertyAt: #warnings ifAbsentPut: [ OrderedCollection new ]