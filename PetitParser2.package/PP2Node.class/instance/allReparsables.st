reparsing
allReparsables
	^ self propertyAt: #allReparsables ifAbsentPut: [
		self collectReparsables
	]