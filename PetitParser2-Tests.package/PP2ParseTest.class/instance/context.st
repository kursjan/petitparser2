accessing
context
	context isNil ifTrue: [ 
		context := super context
	].

	^ context