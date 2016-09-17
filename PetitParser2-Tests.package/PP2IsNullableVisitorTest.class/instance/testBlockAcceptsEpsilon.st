tests
testBlockAcceptsEpsilon
	| block |
	block := [ :context | context next ] asPParser
					isNullable: true;
					yourself.
	self assertIsNullable: block.