converting
asReportTable
	| backtrackPerCharacter restoreCount rememberCount table |
	rememberCount := (self countFor: #remember).
	restoreCount := (self countFor: #restore).
	backtrackPerCharacter := (restoreCount / (totalSize max: 1) asFloat).
	
	table := OrderedCollection new. 
	table add: (Array with: backtrackPerCharacter with: #'backtrack per character' with: backtrackPerCharacter).
	table add: (Array with: totalSize with: #'total stream size' with: totalSize).
	table add: (Array with: rememberCount with: #'remember count' with: rememberCount).
	table add: (Array with: restoreCount with: #'restore count' with: restoreCount).

	^ table