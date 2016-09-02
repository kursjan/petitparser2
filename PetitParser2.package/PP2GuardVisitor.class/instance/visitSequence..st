visiting
visitSequence: node
	self visit: node firstChild.
	
	node children allButFirst do: [ :child |
		self visitUnguarded: child.
	].

