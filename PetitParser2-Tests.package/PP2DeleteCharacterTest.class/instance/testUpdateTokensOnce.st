tests
testUpdateTokensOnce
	| token returnValue originalInput |

	originalInput := '__foobar'.

	token := PP2Token on: originalInput start: 3 stop: 5.
	
	returnValue := OrderedCollection with: token with: #foobar with: token.

	change input: '_foobar'.
	change position: 1.
	change updateTokens: returnValue.
	
	self assert: token start equals: 2.
	self assert: token stop equals: 4.
	self assert: token value = 'foo'.