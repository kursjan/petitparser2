parsing
parse: anObject onError: aBlock
	"Parse anObject with the receiving parser and answer the parse-result or answer the result of evaluating aBlock. Depending on the number of arguments of the block it is simply evaluated, evaluated with the failure object, or evaluated with the error message and position."
	
	| result |
	result := self parse: anObject.
	result isPetit2Success ifTrue: [ ^ result ].
	
	(aBlock numArgs = 0) ifTrue: [ ^ aBlock value ].
	(aBlock numArgs = 1) ifTrue: [ ^ aBlock value: result ].
	^ aBlock value: result message value: result position