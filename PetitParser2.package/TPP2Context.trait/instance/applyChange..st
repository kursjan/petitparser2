reparsing
applyChange: change
	change updateContext: self.
	change updateTokens: self returnValue.
	change updateParser: self parser