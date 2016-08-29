accessing
stream: aStream
	super stream: aStream.
	
	totalSize := totalSize + readLimit.
	lastStreamIndex := events size.
