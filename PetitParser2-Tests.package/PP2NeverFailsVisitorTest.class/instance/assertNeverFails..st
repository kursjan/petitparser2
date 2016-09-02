support
assertNeverFails: node
	| retval |
	retval := visitor visit: node.
	self assert: retval