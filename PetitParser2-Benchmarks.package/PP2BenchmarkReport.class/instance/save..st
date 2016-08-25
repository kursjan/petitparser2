reporting
save: filename
	| file    |
	file := FileStream forceNewFileNamed: filename.
	self show: file.
	file close.