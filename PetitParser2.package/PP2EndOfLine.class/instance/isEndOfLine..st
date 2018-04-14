newline handling
isEndOfLine: context
	context atEnd ifTrue: [ ^ true ].
	(self insideCRLF: context) ifTrue: [ ^ false ].
	^ (context peek = (Character codePoint: 13) or: [ context peek = (Character codePoint: 10)]).