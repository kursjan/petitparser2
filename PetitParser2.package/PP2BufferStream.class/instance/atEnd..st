context interface
atEnd: readPosition
	self upToPosition: readPosition.
	
	^ (readPosition >= position) and: [ stream atEnd ]