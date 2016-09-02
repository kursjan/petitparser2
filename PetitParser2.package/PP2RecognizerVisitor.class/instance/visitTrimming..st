visiting
visitTrimming: node
	self markNode: node.
	self visitRecognizer: node trimmer.
	self visit: node child.