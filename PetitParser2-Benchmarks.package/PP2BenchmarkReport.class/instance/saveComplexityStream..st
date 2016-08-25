reporting complexity
saveComplexityStream: stream
	(self groupBy: #size) keysAndValuesDo: [ :size :subentries |
		self saveComplexityEntries: subentries stream: stream
	]