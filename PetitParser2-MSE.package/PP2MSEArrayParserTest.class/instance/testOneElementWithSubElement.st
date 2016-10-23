tests-start
testOneElementWithSubElement
	self assert: '((X (sub (Y))))' is: #(#('X' nil #(#('sub' #('Y' nil #())))))