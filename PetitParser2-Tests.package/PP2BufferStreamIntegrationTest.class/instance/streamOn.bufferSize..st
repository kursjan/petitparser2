tests
streamOn: aString bufferSize: size
	^ PP2BufferStream on: (PP2MinimalStream on: aString) bufferSize: size