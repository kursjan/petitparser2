tests
testUpdateTokensOnce
	| token returnValue originalInput |

	originalInput := '_foobar'.

	token := PP2Token on: originalInput start: 2 stop: 4.
	
	returnValue := OrderedCollection with: token with: #foobar with: token.

	change input: '__foobar'.
	change position: 1.
	change updateTokens: returnValue.
	
	self assert: token start equals: 3.
	self assert: token stop equals: 5.
	self assert: token value = 'foo'.