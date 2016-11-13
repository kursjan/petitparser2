converting
asReportTable
	| backtrackPerCharacter restoreCount rememberCount table lwRememberCount lwRestoreCount lwBacktrackPerCharacter |
	rememberCount := (self countFor: #remember).
	restoreCount := (self countFor: #restore).
	backtrackPerCharacter := (restoreCount / (totalSize max: 1) asFloat).

	lwRememberCount := (self countFor: #rememberPosition).
	lwRestoreCount := (self countFor: #restorePosition).
	lwBacktrackPerCharacter := (lwRestoreCount / (totalSize max: 1) asFloat).

	table := OrderedCollection new. 
	table add: (Array with: totalSize with: #'total stream size' with: totalSize).

	table add: (Array with: backtrackPerCharacter with: #'backtrack per character' with: backtrackPerCharacter).
	table add: (Array with: rememberCount with: #'remember count' with: rememberCount).
	table add: (Array with: restoreCount with: #'restore count' with: restoreCount).

	table add: (Array with: lwBacktrackPerCharacter with: #'lightweight backtrack per character' with: lwBacktrackPerCharacter).
	table add: (Array with: lwRememberCount with: #'lightweight remember count' with: lwRememberCount).
	table add: (Array with: lwRestoreCount with: #'lightweight restore count' with: lwRestoreCount).

	^ table