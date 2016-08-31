visiting
visitTrimming: node
	self visitRecognizer: node trimmer.
	self visit: node child.