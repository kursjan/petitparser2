*PetitParser2-GUI
debugResult
	^ self globalAt: #debugResult ifAbsentPut: [ 
		| context |
		context := self copy.
		context restore: self startMemento.
		context parser enableDebug parseWithContext: context.
		context currentDebugResult
	]