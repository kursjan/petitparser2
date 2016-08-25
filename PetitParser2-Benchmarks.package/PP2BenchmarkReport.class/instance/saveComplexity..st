reporting complexity
saveComplexity: filename
	| file    |
	file := FileStream forceNewFileNamed: filename.
	self saveComplexityStream: file.
	file close.