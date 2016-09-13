visiting
visitPP2Node: node
	| retval |
	retval := IdentitySet new.
	node children do: [ :child | 
		retval addAll: (self visit: child)
	].
	retval add: node.
	
	^ retval