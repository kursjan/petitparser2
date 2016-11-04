visiting
visitAnd: node
	^ node propertyAt: #contextChanges ifAbsentPut: [ 
		PP2CaChange noChange 
	]