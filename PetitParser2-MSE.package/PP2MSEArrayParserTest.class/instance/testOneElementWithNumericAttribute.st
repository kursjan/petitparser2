tests-start
testOneElementWithNumericAttribute
	self assert: '((X.Y (attribute 2)))' is: #(('X.Y' nil #(('attribute' 2)))).
	self assert: '((X.Y (attribute 2.1)))' is: #(('X.Y' nil #(('attribute' 2.1)))).
	self assert: '((X.Y (attribute 1234.567)))' is: #(('X.Y' nil #(('attribute' 1234.567))))