visiting
visitPush: node
	^ node propertyAt: #contextChanges ifAbsentPut: [ 
		(self visit: node child) isContextChange ifFalse: [
			PP2CaChange push
		] ifTrue: [  
			PP2CaChange change
		]
	]