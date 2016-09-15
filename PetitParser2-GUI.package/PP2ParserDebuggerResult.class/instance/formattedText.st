printing
formattedText
	^ self result isPetit2Failure 
		ifTrue: [ Text string: self printString attribute: TextColor gray ]
		ifFalse: [ self printString]