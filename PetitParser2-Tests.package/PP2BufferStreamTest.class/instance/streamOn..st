running
streamOn: collection
	^ PP2BufferStream on: (PP2MinimalStream on: collection)