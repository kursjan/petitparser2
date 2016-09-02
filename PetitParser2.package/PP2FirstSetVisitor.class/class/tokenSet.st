instance creation
tokenSet
	^ self on: [ :e | e isToken or: [ e isFirstSetTerminal  ] ]