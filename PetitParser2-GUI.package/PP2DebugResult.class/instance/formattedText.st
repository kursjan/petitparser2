printing
formattedText
	self result isPetit2Failure ifTrue: [ 
		^ Text string: self printString attribute: TextColor gray 
	].
	
	(self isBiggestChild) ifTrue: [  
		^ Text string: self printString attribute: (TextColor new color: Color red muchDarker)
	].
	
	^ self printString