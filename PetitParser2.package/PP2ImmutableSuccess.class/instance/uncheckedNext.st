stream mimicry
uncheckedNext
	^ super copy
			retval: (stream atPosition: position + 1);
			position: position + 1;
			yourself