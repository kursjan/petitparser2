visiting
visitChoice: node
	^ node propertyAt: #contextChanges ifAbsentPut: [ 
		| results |
		results := node children collect: [:child | self visit: child ].
		results asSet size = 1 ifTrue: [ results anyOne ] ifFalse: [  
			PP2CaChange change
		]
	]