stream mimicry
next
	^ (stream atEnd: position) not ifTrue: [ 
		position := position + 1.
		stream atPosition: position
	] ifFalse: [  
		nil
	]