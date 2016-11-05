visiting
visitWater: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		self assert: (self visit: node waterToken) isContextChange not.
		self assert: (self visit: node boundary) isContextChange not.
		PP2CcChange noChange 
	]