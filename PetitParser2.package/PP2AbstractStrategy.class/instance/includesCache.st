analysis
includesCache
	^ self allChildren anySatisfy: [ :s | s isCache ]