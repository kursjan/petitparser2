as yet unclassified
testMultilineSinglePairWithCollection
	self assert: 'Header: value1,
 value2' is: {'Header'->#('value1' 'value2')}