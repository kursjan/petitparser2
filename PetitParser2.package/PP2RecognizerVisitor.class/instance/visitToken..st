visiting
visitToken: node

	inToken push: true.
	self visit: node child.
	inToken pop