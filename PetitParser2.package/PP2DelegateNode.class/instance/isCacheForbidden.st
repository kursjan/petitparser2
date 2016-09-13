as yet unclassified
isCacheForbidden
	self isJustDelegate ifFalse: [  
		^ super isCacheForbidden 
	].

	^ super isCacheForbidden or: [ self child isCacheForbidden  ]