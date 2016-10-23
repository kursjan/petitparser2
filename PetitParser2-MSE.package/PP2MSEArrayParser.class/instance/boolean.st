values
boolean 
	^ super boolean 
	
	==> [:token | token value = 'true' ifTrue: [true] ifFalse: [token value = 'false' ifTrue: [false] ifFalse: [nil]]] 