stream mimicry
next: size
	^ ((stream atEnd: position + size - 1) not) ifTrue: [ 
		super copy
			retval: (stream copyFrom: position  to: position + size - 1);
			position: position + size;
			yourself
	] ifFalse: [ 
		super copy
			retval: nil;
			position: position;
			yourself
	]