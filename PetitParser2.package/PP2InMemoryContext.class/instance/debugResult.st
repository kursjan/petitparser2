gt
debugResult
	^ self globalAt: #debugResult ifAbsentPut: [ PP2ParserDebuggerResult new stream: self ]