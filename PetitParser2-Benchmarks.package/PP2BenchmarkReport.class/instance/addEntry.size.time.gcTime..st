logging
addEntry: parserName size: inputSize time: milliseconds gcTime: gcMilliseconds
	| entry |
	entry := PP2BenchmarkEntry new
		name: parserName ;
		size: inputSize ;
		time: milliseconds ;
		gcTime: gcMilliseconds ;
		timestamp: DateAndTime current.
		
	self addEntry: entry