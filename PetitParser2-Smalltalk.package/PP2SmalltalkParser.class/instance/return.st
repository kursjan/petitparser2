grammar
return
	^ super return map: [ :token :expressionNode | RBReturnNode return: token start value: expressionNode ]