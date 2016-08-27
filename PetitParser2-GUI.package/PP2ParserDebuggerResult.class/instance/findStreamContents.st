accessing
findStreamContents
	^ (self findStream ifNotNilDo: [ :s | s contents ]) ifNil: [ '' ]