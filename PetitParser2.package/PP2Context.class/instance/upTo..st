stream mimicry
upTo: character
	| start |
	start := position := position + 1.
	
	[ 
		(stream atEnd: position) ifTrue: [  
			^ stream copyFrom: start to: position	
		].
		(stream atPosition: position) = character
		
	] whileFalse: [ position := position + 1 ].

	^ stream copyFrom: start to: position 

