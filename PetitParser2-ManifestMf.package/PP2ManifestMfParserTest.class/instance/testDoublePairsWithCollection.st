as yet unclassified
testDoublePairsWithCollection
	self 
		assert: 'Header: value1,value2
Header2: value3, value4'
		is: {'Header'->#('value1' 'value2') . 'Header2'->#('value3' 'value4')}