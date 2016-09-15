support
assertIsNullable: node
	| retval |
	retval := visitor visit: node.
	self assert: retval