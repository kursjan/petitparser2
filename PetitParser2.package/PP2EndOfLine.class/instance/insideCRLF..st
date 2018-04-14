newline handling
insideCRLF: context
	(context position < 1) ifTrue: [ ^ false ].
	
	^ (context peek = (Character codePoint: 10)) and: [ context peekBack = (Character codePoint: 13) ]