as yet unclassified
testSingleLine
	self assert: '1 , 2, 3' is: #(('1' '2' '3')).
	self assert: 'a1 , 2, 3' is: #(('a1' '2' '3')).
	self assert: 'a , 2, 3' is: #(('a' '2' '3')).
