visiting
visitEndOfLine: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]