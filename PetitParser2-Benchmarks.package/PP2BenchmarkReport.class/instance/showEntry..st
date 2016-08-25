reporting
showEntry: entry

	Transcript crShow: 'Size: ', entry size asString.
	Transcript crShow: entry name, ' time: ', entry time asString.
	Transcript crShow: 'Time per character: ', (entry tpc * 1000.0) asString, ' microseconds'.
	
	Transcript crShow: 'GC time: ', (entry gcTime) asString, 'ms'.