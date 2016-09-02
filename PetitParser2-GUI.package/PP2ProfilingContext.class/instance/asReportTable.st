converting
asReportTable
	| restoreCount rememberCount table |
	rememberCount := (self countFor: #remember).
	restoreCount := (self countFor: #restore).
	
	table := OrderedCollection new. 
	table add: #'backtrack per character' -> (restoreCount / (totalSize + 1.0)).
	table add: #'total stream size' -> totalSize .
	table add: #'remember count' -> rememberCount.
	table add: #'restore count' -> restoreCount.

	parser allCaches do: [ :c | 
		table add: c -> c hitRatio.
	].

	^ table