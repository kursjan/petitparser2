tests
testBlockAcceptsEpsilon
	| block |
	block := [ :context | context next ] asParser2
					isNullable: true;
					yourself.
	self assertIsNullable: block.