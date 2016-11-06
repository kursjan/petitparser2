tests
testSea
	|  parser island result |
	
	island := $a asPParser plus flatten.
	parser := island sea.

	parser optimize.
	result := parser debug: '..aa..'.
	self assert: result debugResult steps equals: 33.	
