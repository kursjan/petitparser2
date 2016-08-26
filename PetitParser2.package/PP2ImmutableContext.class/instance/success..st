failures
success: retval
	^ PP2ImmutableSuccess new
		stream: stream;
		position: position;
		retval: retval;
		parser: parser;
		continuationStack: continuationStack;
		yourself