tests-start
testOneElementWithBooleanAttribute
	self assert: '((X.Y (attribute true)))' is: #(('X.Y' nil #(('attribute' true))))