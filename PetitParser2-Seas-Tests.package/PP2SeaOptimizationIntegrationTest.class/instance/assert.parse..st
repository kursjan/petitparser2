parse support
assert: parser parse: input
	parser optimize.
	result := (super assert: parser parse: input) value