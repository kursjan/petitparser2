printing
printOnStream: stream
	stream cr; nextPutAll: 'Validated in: ', time asMilliSeconds asString, 'ms on ', sources  size asString, ' files'.
	stream cr; nextPutAll: 'precision: ', (self precision printShowingDecimalPlaces: 3).
	stream cr; nextPutAll: 'recall: ', (self recall printShowingDecimalPlaces: 3).
	stream cr; nextPutAll: 'total elements: ', (self total asString).
	stream cr; nextPutAll: 'failure rate: ', (self failureRate printShowingDecimalPlaces: 3).
	stream cr; nextPutAll: 'average time: ', (self timePerSource printShowingDecimalPlaces: 3), 'ms'.
	
	stream cr; nextPutAll: 'failures: ', failures size asString.
	stream cr; nextPutAll: 'timeouts: ', timeouts size asString.
	stream cr; nextPutAll: 'errors: ', errors size asString.
	stream flush.
