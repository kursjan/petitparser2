*PetitParser2-GUI
debug: input withContext: startContext
	^ (PP2DebuggingInterpret on: self) parse: input withContext: startContext
