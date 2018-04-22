tests
testUpdateTokens
	| token anotherToken returnValue originalInput |

	originalInput := '_foobar'.

	token := PP2Token on: originalInput start: 2 stop: 4.
	anotherToken := PP2Token on: originalInput start: 5 stop: 7.
	
	returnValue := OrderedCollection with: token with: #foobar with: anotherToken.

	change input: '__foobar'.
	change position: 1.
	change updateTokens: returnValue.
	
	self assert: token start equals: 3.
	self assert: token stop equals: 5.
	self assert: token value = 'foo'.
	
	self assert: anotherToken start equals: 6.
	self assert: anotherToken stop equals: 8.
	self assert: anotherToken value equals: 'bar'.