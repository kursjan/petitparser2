support
visit: node guardedWith: classification
	guarded push: classification.
	self visit: node.
	guarded pop.
	