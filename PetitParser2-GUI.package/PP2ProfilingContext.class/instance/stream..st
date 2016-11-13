accessing
stream: aStream
	super stream: aStream.

	furthestPosition := position.
	totalSize := totalSize + readLimit.
	lastStreamIndex := events size.
