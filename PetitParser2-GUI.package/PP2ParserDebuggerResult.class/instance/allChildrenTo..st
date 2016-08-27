analysis
allChildrenTo: set
	set add: self.
	self children do: [ :child | child allChildrenTo: set ].