reporting
showDetailed
	(self groupBy: #name) keysAndValuesDo: [ :name :subentries |
		self showEntries: subentries
	]