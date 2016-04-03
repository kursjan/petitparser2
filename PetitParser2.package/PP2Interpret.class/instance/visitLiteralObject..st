visiting
visitLiteralObject: parser
	^ (currentContext atEnd not and: [ parser literal = currentContext uncheckedPeek ])
		ifFalse: [ currentContext failure: message ]
		ifTrue: [ currentContext next ]