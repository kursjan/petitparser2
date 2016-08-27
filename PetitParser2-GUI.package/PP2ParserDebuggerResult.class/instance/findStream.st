as yet unclassified
findStream
	
	stream ifNil: [ ^ parent ifNotNil: [ parent findStream ] ].
	^ stream