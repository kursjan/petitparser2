reporting
show: stream
	(self groupBy: #name) keysAndValuesDo: [ :name :subentries |
		self saveEntriesNamed: name entries: subentries stream: stream
	].

