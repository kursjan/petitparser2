visiting
visitOptional: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		| result |
		result := self visit: node child.
		
		result isContextChange ifTrue: [  
			PP2CcResult change
		] ifFalse: [  
			PP2CcResult noChange 
		]
	]