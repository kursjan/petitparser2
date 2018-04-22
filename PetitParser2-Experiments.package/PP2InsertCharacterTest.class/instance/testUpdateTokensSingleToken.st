tests
testUpdateTokensSingleToken
	| returnValue originalInput |

	originalInput := '_foobar'.
	returnValue := PP2Token on: originalInput start: 2 stop: 4.
	
	
	change input: '__foobar'.
	change position: 1.
	change updateTokens: returnValue.
	
	self assert: returnValue start equals: 3.
	self assert: returnValue stop equals: 5.
	self assert: returnValue value = 'foo'.