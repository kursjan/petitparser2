tests-start
testOneElementWithMultipleSubElements
	self assert: '((X (sub (Y) (Z))))' is: #(#('X' nil #(#('sub' #(#('Y' nil #()) #('Z' nil #())))))).
	