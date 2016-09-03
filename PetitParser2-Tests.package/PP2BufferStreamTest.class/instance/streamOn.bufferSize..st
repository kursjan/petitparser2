running
streamOn: collection bufferSize: size
	^ PP2BufferStream on: (PP2MinimalStream on: collection) bufferSize: size