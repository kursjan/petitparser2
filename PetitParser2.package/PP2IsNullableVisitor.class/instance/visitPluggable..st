visiting
visitPluggable: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		"Be conservative, we dont know for sure, so it is safer to report true"
		false
	]