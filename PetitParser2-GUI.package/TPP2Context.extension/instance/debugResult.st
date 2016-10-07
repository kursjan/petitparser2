*PetitParser2-GUI
debugResult
	^ self globalAt: #debugResult ifAbsentPut: [ PP2DebugResult new context: self; yourself ]