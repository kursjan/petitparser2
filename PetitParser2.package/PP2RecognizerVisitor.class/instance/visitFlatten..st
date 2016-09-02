visiting
visitFlatten: node
	self markNode: node.
	self visitRecognizer: node child