java
javaSourcesInDirectory: directory
	| files |
	files := self readDirectory: directory.
	files := self files: files withExtension: 'java'.
	
	^ files collect: [ :f | [ (FileStream fileNamed: f) contents ] on: UTF8InvalidText do: [ '' ] ]