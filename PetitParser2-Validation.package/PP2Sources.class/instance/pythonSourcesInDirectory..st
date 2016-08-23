python
pythonSourcesInDirectory: directory
	| files |
	files := self readDirectory: directory.
	files := self files: files withExtension: 'py'.
	
	^ files collect: [ :f | (FileStream fileNamed: f) contents ]