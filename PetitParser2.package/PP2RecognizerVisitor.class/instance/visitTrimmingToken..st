visiting
visitTrimmingToken: node
	self markNode: node.
	self visitRecognizer: node trimmer.
	self visitRecognizer: node child.