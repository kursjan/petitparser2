stream mimicry
peek
	^ (stream atEnd: position) not ifTrue: [ 
		stream atPosition: position + 1
	]