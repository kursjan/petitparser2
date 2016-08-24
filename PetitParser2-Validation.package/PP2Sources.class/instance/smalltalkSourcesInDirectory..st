smalltalk
smalltalkSourcesInDirectory: directory
	| files |
	"Transcript crShow: 'sources from directory: ', directory."
	files := self readDirectory: directory.
	files := self files: files withExtension: 'st'.
	
	^ files collect: [ :f | (FileStream fileNamed: f) contents ]