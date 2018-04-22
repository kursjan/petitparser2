tests
testUpdateTokensSingleToken
	| returnValue originalInput |

	originalInput := '__foobar'.
	returnValue := PP2Token on: originalInput start: 3 stop: 5.
	
	
	change input: '_foobar'.
	change position: 1.
	change updateTokens: returnValue.
	
	self assert: returnValue start equals: 2.
	self assert: returnValue stop equals: 4.
	self assert: returnValue value = 'foo'.