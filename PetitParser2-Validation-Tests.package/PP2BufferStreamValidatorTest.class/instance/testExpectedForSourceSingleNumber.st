tests
testExpectedForSourceSingleNumber
	| result |
	result := validator expectedForSource: '52'.
	
	self assert: result isCollection.