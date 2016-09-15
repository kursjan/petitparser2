visiting
visitWrapping: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		"Be conservative, we don't know for sure, so it is safer to report false"
		node doesFunctionalChanges ifTrue: [ false ] ifFalse: [ 
			self visit: node child.
		]
	]