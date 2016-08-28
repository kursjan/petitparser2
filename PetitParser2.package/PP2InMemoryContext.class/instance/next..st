accessing
next: anInteger 
	| endPosition |

	endPosition := position + anInteger.
	^ (endPosition <= readLimit) ifTrue: [ 
		collection copyFrom: position+1 to: (position := endPosition).	
	] ifFalse: [  
		nil
	]