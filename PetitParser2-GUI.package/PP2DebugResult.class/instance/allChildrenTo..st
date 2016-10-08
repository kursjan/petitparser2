analysis
allChildrenTo: set
	self halt.
	set add: self.
	self children do: [ :child | child allChildrenTo: set ].