copying
copy
	^ (self species new)
		position: position;
		stream: stream;
		parser: parser; "TODO JK: not needed now.."
		continuationStack: continuationStack;
		yourself