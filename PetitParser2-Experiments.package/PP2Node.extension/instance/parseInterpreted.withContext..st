*PetitParser2-Experiments
parseInterpreted: input withContext: startContext
	^ (PP2Interpret on: self) parse: input withContext: startContext
