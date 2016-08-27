printing
formattedText
	^ self result isPetitFailure 
		ifTrue: [ Text string: self printString attribute: TextColor gray ]
		ifFalse: [ self printString]