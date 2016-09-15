optimizations
unsetOptimized
	^ self allNodesDo: [ :node | node propertyAt: #optimized put: false ]