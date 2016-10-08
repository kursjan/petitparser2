analysis
allResultsTo: set
	set add: self.
	self children do: [ :child | child allResultsTo: set ].