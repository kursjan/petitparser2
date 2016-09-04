initialization
initialize
	super initialize.
	
	closed := false.
	queue := OrderedCollection new.
	accessSemaphore := Mutex new.
	