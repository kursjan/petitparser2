stream mimicry
next
	^ ((stream atEnd: position) not) ifTrue: [ 
		super copy
			retval: (stream atPosition: position + 1);
			position: position + 1;
			yourself
	] ifFalse: [ 
		super copy
			retval: nil;
			position: position;
			yourself
	]