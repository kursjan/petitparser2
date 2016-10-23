tests-start
testOneElementWithId
	self assert: '((FAMIX.Class (id: 1)))' is: #(('FAMIX.Class' #('id' 1) #())).
	self assert: '( ( FAMIX.Class (id: 1) ) )' is: #(('FAMIX.Class' #('id' 1) #())).
	self assert: '( 
	( FAMIX.Class (id: 1) )
)' is: #(('FAMIX.Class' #('id' 1) #())).
	self assert: '( 
(FAMIX.Class (id: 1)
)
)' is: #(('FAMIX.Class' #('id' 1) #()))