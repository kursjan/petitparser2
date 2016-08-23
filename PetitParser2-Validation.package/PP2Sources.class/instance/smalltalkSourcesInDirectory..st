smalltalk
smalltalkSourcesInDirectory: directory
	| files |
	files := self readDirectory: directory.
	files := self files: files withExtension: 'st'.
	
	^ files collect: [ :f | (FileStream fileNamed: f) contents ]