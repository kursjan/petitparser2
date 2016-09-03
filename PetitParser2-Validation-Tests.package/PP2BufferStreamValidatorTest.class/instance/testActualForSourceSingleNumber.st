tests
testActualForSourceSingleNumber
	| result |
	result := validator actualForSource: '52'.
	
	self assert: result isCollection.