visiting
visitPossesiveRepeating: node
	^ node propertyAt: #contextChanges ifAbsentPut: [ 
		| result |
		result := self visit: node child.
		
		result isContextChange ifTrue: [  
			PP2CaResult change
		] ifFalse: [  
			PP2CaResult noChange 
		]
	]