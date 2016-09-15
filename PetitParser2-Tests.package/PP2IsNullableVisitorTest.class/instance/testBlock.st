tests
testBlock
	| block |
	block := [ :context | context next ] asParser2.
	self denyIsNullable: block.