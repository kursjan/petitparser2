debugging
currentDebugResult
	^ self globalAt: #debugResult ifAbsentPut: [ PP2DebugResult new context: self; yourself ]