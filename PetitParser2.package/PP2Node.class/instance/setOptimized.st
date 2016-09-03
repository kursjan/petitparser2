optimizations
setOptimized
	^ self allNodesDo: [ :node | node propertyAt: #optimized ifAbsentPut: true ]