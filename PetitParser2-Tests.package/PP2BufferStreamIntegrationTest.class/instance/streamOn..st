tests
streamOn: aString
	^ PP2BufferStream on: (PP2MinimalStream on: aString)