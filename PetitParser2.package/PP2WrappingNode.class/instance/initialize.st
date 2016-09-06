initialization
initialize
	super initialize.
	strategy := PP2Wrapping on: self.
	self functionalChanges: true.