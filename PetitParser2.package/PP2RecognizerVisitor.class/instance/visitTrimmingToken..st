visiting
visitTrimmingToken: node
	self visitRecognizer: node trimmer.
	self visitRecognizer: node child.