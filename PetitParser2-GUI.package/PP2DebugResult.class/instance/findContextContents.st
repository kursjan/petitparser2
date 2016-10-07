accessing
findContextContents
	^ (self findContext ifNotNil: [ :s | s contents ]) ifNil: [ '' ]