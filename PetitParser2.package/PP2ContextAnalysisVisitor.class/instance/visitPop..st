visiting
visitPop: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		(self visit: node child) isContextChange ifFalse: [
			PP2CaChange pop
		] ifTrue: [  
			PP2CaChange change
		]
	]