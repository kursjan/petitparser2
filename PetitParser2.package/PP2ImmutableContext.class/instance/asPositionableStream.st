converting
asPositionableStream
	^ (ReadStream on: stream collection)
		position: position;
		yourself