printing
printCompactOnStream: stream
	stream nextPutAll: self parserName; tab.
	stream nextPutAll: self precision asString; tab.
	stream nextPutAll: self recall asString; tab.
	stream nextPutAll: self failureRate asString; tab.
	stream nextPutAll: self timePerSource asString; tab.
	
	stream nextPutAll: failures size asString; tab.
	stream nextPutAll: timeouts size asString; tab.
	stream nextPutAll: errors size asString; cr.
	stream flush.
