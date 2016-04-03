failures
success: retval
	^ PP2Success new
		stream: stream;
		position: position;
		retval: retval;
		parser: parser;
		continuationStack: continuationStack;
		yourself