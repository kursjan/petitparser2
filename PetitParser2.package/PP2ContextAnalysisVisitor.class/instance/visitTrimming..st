visiting
visitTrimming: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		self assert: (self visit: node trimmer) isContextChange not.
		self visit: node child
	]