tests-start
testOneElementWithStringAttribute
	self assert: '((FAMIX.Class (name ''Something'')))' is: #(('FAMIX.Class' nil #(('name' 'Something')))).
	self assert: '((FAMIX.Class (attribute ''as:.,><asd'')))' is: #(('FAMIX.Class' nil #(('attribute' 'as:.,><asd')))).