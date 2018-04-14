newline handling
isStartOfLine: context
	(context position = 0) ifTrue: [ ^ true ].

	(self insideCRLF: context) ifTrue: [ ^ false ].
	
	^ (context peekBack = (Character codePoint: 13)) or: [ context peekBack = (Character codePoint: 10)].