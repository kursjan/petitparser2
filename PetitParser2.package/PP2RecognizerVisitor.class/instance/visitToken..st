visiting
visitToken: node
	self markNode: node.
	self visitRecognizer: node child