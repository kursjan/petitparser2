parsing - interpretation
parseInterpreted: input withContext: startContext
	^ (PP2Interpret on: self) parse: input withContext: startContext
