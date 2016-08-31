tests
testBlockAcceptsEpsilon
	| block |
	block := [ :context | context next ] asParser2
					acceptsEpsilon: true;
					yourself.
	self assertAcceptsEpsilon: block.