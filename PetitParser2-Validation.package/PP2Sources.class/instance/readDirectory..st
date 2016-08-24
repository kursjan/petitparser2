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

		file := self class dataDirectory asFileReference / directory.
		file exists ifFalse: [ 
			self error: 'Directory', directory asString, ' does not exist'.
		].
		^ file allFiles asSortedCollection 
	]

	"Modified: / 10-05-2015 / 07:54:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"