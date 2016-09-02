tests
testBlockAcceptsEpsilon
	| block |
	block := [ :context | context next ] asParser2
					neverFails: true;
					yourself.
	self assertNeverFails: block.