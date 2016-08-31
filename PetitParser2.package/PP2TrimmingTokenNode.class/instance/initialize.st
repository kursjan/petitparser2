initialization
initialize
	super initialize.
	strategy := PP2TrimmingToken on: self.
	tokenClass := self defaultTokenClass