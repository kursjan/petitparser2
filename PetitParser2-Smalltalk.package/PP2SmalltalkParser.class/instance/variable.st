grammar
variable
	^ super variable ==> [ :token | RBVariableNode identifierNamed: token value  at: token start ]