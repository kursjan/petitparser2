visiting
visitLiteralSequence: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]