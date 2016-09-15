optimizations
setOptimized
	^ self allNodesDo: [ :node | node propertyAt: #optimized put: true ]