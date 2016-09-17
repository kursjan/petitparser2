utility
readDirectory: directory
	| file |

	( (Smalltalk respondsTo: #isSmalltalkX) and:[ Smalltalk isSmalltalkX ] ) ifTrue:[ 
		file := self class dataDirectory asFilename / directory.
		file exists ifFalse:[  
			self error: 'Directory does not exist'.
		].
		^ (file recursiveDirectoryContentsAsFilenames select:[:each | each isRegularFile ]) asSortedCollection 
	] ifFalse:[ 
		"Assuming Pharo..."
		ZnClient new
			url: 'http://scg.unibe.ch/download/jk/sources/smalltalk-src-selected.zip';
			signalProgress: true;
			downloadTo: FileSystem workingDirectory.
		file := (FileSystem zip: 'smalltalk-src-selected.zip' asFileReference) open workingDirectory.

"		file := self class dataDirectory download
		file := self class dataDirectory asFileReference / directory.
		file exists ifFalse: [ 
			self error: 'Directory', directory asString, ' does not exist'.
		].
"		^ file allFiles asSortedCollection 
	]

	"Modified: / 10-05-2015 / 07:54:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"