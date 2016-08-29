converting
asReportTable
	| restoreCount rememberCount |
	rememberCount := (self countFor: #remember).
	restoreCount := (self countFor: #restore).
	
	^{ 
		#'backtrack per character' -> (restoreCount / (totalSize + 1.0)).
		#'total stream size' -> totalSize .
		#'remember count' -> rememberCount.
		#'restore count' -> restoreCount.
	}