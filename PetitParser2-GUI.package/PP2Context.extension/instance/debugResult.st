*PetitParser2-GUI
debugResult
	^ self globalAt: #debugResult ifAbsentPut: [ PP2ParserDebuggerResult new context: self; yourself ]