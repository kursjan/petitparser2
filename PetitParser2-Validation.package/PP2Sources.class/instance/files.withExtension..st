utility
files: files withExtension: extension
	^ files select: [ :f | f extension = extension ] 