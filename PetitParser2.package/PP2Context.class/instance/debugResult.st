debugging
debugResult
	^ self globalAt: #debugResult ifAbsentPut: [ 
		| context |
		context := self copy.
		context restore: self startMemento.
		context parser duplicate enableDebug parseWithContext: context.
		context currentDebugResult
	]