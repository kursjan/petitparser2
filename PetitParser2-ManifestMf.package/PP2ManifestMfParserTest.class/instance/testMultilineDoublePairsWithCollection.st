as yet unclassified
testMultilineDoublePairsWithCollection
	self 
		assert: 'Header: value1,
 value2
Header2: value3,
 value4' 
		is: {'Header'->#('value1' 'value2') . 'Header2'->#('value3' 'value4')}