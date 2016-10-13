tests
testUpdateTokensAfterChange
	| token anotherToken returnValue originalInput |

	originalInput := 'foo___bar'.

	token := PP2Token on: originalInput start: 1 stop: 3.
	anotherToken := PP2Token on: originalInput start: 7 stop: 9.
	
	returnValue := OrderedCollection with: token with: #foobar with: anotherToken.

	change input: 'foo__bar'.
	change position: 5.
	change updateTokens: returnValue.
	
	self assert: token start equals: 1.
	self assert: token stop equals: 3.
	self assert: token value = 'foo'.
	
	self assert: anotherToken start equals: 6.
	self assert: anotherToken stop equals: 8.
	self assert: anotherToken value equals: 'bar'.