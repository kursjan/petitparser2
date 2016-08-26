failures
failure: message
	
		^ PP2ImmutableFailure new
			stream: stream;
			position: position;
			parser: parser;
			continuationStack: continuationStack;
			message: message;
			yourself