tests
testBlock
	| block |
	block := [ :context | context next ] asPParser.
	self denyIsNullable: block.