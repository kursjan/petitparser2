visiting
visitRecognizer: node

	inToken push: true.
	self visit: node.
	inToken pop