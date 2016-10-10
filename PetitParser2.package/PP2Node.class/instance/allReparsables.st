reparsing
allReparsables
	^ self propertyAt: #allReparsables ifAbsent: [
		self collectReparsables
	]