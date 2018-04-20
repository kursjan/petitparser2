visiting
visitLiteralObject: parser
	^ (currentContext atEnd not and: [ parser literal = currentContext uncheckedPeek ])
		ifFalse: [ PP2Failure message: parser message context: currentContext ]
		ifTrue: [ currentContext uncheckedNext ]