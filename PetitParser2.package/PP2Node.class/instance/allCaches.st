optimizations
allCaches
	^ self propertyAt: #allCaches ifAbsentPut: [
		| caches |
		caches := IdentitySet new. 
		self allChildrenDo: [ :c | c strategies do: [ :s | s isCache ifTrue: [ caches add: s ] ] ].
		caches asArray
	]