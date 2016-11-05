visiting
visitPush: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		(self visit: node child) isContextChange ifFalse: [
			PP2CcChange push
		] ifTrue: [  
			PP2CcChange change
		]
	]