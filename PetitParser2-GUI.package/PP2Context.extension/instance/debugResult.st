*PetitParser2-GUI
debugResult
	^ self globalAt: #debugResult ifAbsentPut: [ PP2ParserDebuggerResult new stream: self stream ]