as yet unclassified
parse: aString onError: anError
	| result highlightedText time |
	
	time := [ result := parser reparseWithContext: (self context: aString) ] timeToRun.
	Transcript crShow: 'parsed in: ', time asMilliSeconds asString, 'ms'.
	Transcript show: ' context: ', context identityHash asString.
	Transcript show: ' steps: ', context debugResult steps asString.
	
	highlightedText := aString asText.
	result isPetit2Success ifTrue: [  
		result returnValue asCollection deepFlatten do: [ :el | 
			el isToken ifTrue: [ highlightedText addAttribute: el color from: el start to: el stop ] ]
	] ifFalse: [ 
		highlightedText addAttribute: TextColor red.
	].
	
	^ highlightedText.