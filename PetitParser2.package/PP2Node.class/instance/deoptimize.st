optimizations
deoptimize
	self isOptimized ifFalse: [ ^ self ].
	self allNodesDo: [ :node | node resetStrategies ].
	self unsetOptimized.