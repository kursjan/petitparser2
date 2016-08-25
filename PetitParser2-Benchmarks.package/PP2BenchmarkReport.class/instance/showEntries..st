reporting
showEntries: subentries
	subentries do: [ :e | 
		self showEntry: e
	]