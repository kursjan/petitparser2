tests-start
testOneElement
	self assert: '((X))' is: #(('X' nil #())).
	self assert: '((X.Y))' is: #(('X.Y' nil #())).
	