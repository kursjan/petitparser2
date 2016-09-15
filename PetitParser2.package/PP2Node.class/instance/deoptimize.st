optimizations
deoptimize
	self isOptimized ifFalse: [ ^ self ].
	self allNodesDo: [ :node | node resetStrategy ].
	self unsetOptimized.