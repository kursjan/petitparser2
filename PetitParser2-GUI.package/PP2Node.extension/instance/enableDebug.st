*PetitParser2-GUI
enableDebug
	self allChildren do: [ :child | child strategy: (PP2DebuggingStrategy on: child strategy) ]