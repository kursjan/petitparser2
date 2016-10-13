as yet unclassified
context: aString
	(context isNil or: [context size ~= aString size]) ifTrue: [
		context := aString asReparsableContext
	].

	^ context