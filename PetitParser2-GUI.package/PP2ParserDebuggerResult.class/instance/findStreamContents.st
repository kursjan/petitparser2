as yet unclassified
findStreamContents
	^ (self findStream ifNotNilDo: [ :s | s contents ]) ifNil: [ '' ]