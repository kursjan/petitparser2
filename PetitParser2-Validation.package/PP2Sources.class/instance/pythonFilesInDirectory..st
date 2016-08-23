python
pythonFilesInDirectory: directory
	| files |
	files := self readDirectory: directory.
	^ self files: files withExtension: 'py'.
	
