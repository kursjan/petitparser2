minimal interface
atEnd
	^ accessSemaphore critical: [ queue isEmpty and: closed ]