initialization
initialize
	super initialize.
	strategy := PP2TokenStrategy on: self.
	tokenClass := self defaultTokenClass