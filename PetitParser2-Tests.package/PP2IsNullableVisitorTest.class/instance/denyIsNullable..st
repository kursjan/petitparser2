support
denyIsNullable: node
	| retval |
	retval := visitor visit: node.
	self assert: retval not