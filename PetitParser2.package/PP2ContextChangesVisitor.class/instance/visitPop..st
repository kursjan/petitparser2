visiting
visitPop: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		(self visit: node child) isContextChange ifFalse: [
			PP2CcChange pop
		] ifTrue: [  
			PP2CcChange change
		]
	]