failures
failure: message
	
		^ PP2Failure new
			stream: stream;
			position: position;
			parser: parser;
			continuationStack: continuationStack;
			message: message;
			yourself