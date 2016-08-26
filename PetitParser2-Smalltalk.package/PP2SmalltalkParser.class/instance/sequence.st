grammar
sequence
	^ super sequence map: [ :tempNodes :periodNodes :statementNodes | self build: tempNodes sequence: periodNodes , statementNodes ]