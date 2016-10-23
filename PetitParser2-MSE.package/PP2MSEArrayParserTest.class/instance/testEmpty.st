tests-start
testEmpty
	self assert: '()' is: #().
	self assert: '( )' is: #().
	self assert: ' ( ) ' is: #().