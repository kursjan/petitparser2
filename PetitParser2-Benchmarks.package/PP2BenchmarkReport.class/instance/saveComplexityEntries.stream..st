reporting complexity
saveComplexityEntries: subentries stream: stream
	| entry time gcTime |
	entry := subentries anyOne.
	time := self mean: (subentries collect: #time).
	gcTime := self mean: (subentries collect: #gcTime).
	
	stream 
		nextPutAll: entry name;
		nextPut: Character tab;
		nextPutAll: entry size asString;
		nextPut: Character tab;
		nextPutAll: time asFloat asString;
		nextPut: Character tab;
		nextPutAll: gcTime asFloat asString;
		nextPut: Character lf;
		flush