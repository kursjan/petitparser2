stream mimicry
next: size
	^ ((stream atEnd: position + size - 1) not) ifTrue: [ 
		super copy
			retval: (stream copyFrom: (position + 1) to: position + size);
			position: position + size;
			yourself
	] ifFalse: [ 
		super copy
			retval: nil;
			position: position;
			yourself
	]