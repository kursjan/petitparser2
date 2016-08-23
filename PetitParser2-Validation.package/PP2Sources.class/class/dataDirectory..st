as yet unclassified
dataDirectory: aString
	| dir |
	((Smalltalk respondsTo: #isSmalltalkX) and:[Smalltalk isSmalltalkX]) ifTrue:[
		"Smalltalk/X"
		dir := aString asFilename.
	] ifFalse:[
		"Assume Pharo"
		dir := aString asFileReference.
	].
	dir isDirectory ifFalse:[
		self error: 'Invalid / non-existent data directory.'
	].
	DataDirectory := dir
	"
	PPCResources dataDirectory: '/tmp'
	PPCResources dataDirectory: '/xxx'
	"
	
	