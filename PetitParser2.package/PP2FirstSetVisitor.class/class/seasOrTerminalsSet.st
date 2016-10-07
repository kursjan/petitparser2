instance creation
seasOrTerminalsSet
	^ self 
		on: [ :e | e isSea or: [ e isFirstSetTerminal ] ] 
		on: [ :e | e isSea or: [ e isFirstSetTerminal ] ]