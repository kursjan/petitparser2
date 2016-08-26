instance creation
on: stream position: position continuationStack: stack
	^ self new 
		stream: stream;
		position: position;
		continuationStack: stack;
		yourself