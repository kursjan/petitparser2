debugging
debugResult
	^ self globalAt: #debugResult ifAbsentPut: [ 
		self restore: self startMemento.
		self parser enableDebug parseWithContext: self.
		self currentDebugResult
	]