instance creation
productionSet
	^ self on: [ :e | e isFirstSetTerminal ] on: [ :e | e isProduction ]