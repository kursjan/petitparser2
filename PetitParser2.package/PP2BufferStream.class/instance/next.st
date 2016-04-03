stream access
next
	stream atEnd ifFalse: [ 
		^ self uncheckedNext
	].

	^ nil