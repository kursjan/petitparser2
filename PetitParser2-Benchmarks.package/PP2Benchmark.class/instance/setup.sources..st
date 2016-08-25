setup & teardown
setup: class sources: name
	parser := self instantiate: class.
	input := self sourcesFor: name
	