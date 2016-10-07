accessing
findContext
	
	context ifNil: [ ^ parent ifNotNil: [ parent findContext ] ].
	^ context