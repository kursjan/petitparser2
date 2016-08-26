grammar
method
	^ super method map: [ :methodNode :bodyNode | 
		methodNode pragmas: bodyNode first.
		methodNode body: bodyNode second.
		self buildMethod: methodNode ]