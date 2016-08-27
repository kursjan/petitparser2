parsing - private
parseWithContext: startContext
	| currentContext |
	currentContext := startContext.
	
	(startContext atEnd not and: [ startContext uncheckedPeek isSeparator ]) ifTrue: [
		 ^ currentContext next.
	].
	
	(currentContext atEnd not and: [ currentContext uncheckedPeek = $" ]) ifTrue: [
		currentContext := currentContext next.
		^ currentContext upTo: $".
	].

	^ startContext failure: 'no whitespace or comment found'