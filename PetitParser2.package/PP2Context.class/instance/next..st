stream mimicry
next: size
	^ ((stream atEnd: position + size - 1) not) ifTrue: [ 
		stream copyFrom: (position + 1) to: (position := position + size)
	] ifFalse: [ 
		nil
	]