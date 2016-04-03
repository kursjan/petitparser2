stream access
last
	^ buffer at: ((position - 1) % bufferSize) + 1