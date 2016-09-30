optimizations - caching
isCacheForbidden
	self isJustDelegate ifFalse: [  
		^ super isCacheForbidden 
	].

	^ super isCacheForbidden or: [ self child isCacheForbidden  ]