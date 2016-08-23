expressions
indentExpressionOfSize: size stream: stream indent: indent limit: limit
	| index rand |
	index := 0.
	rand := Random new.

	[index < size] whileTrue: [ 
 		(index ~= 0 and: [ indent < 500 and: [ rand next < 0.1]] ) ifTrue: [  
			| subSize |
			subSize := rand nextInt: (size - index - 1) + 1.

			stream nextPut: Character cr.
			(indent + 1) timesRepeat: [ stream nextPutAll: '    ' ].

			self indentExpressionOfSize: subSize stream: stream indent: (indent + 1) limit: limit.

			stream nextPut: Character cr.
			indent timesRepeat: [ stream nextPutAll: '    ' ].

			index := index + subSize.
		] ifFalse: [ 
			stream nextPutAll: (rand nextInt: 100) asString.
			index := index + 1.
		].
	
		(index < size) ifTrue: [ 
 			(rand next < 0.5) 
				ifTrue: [  stream nextPutAll: '+' ] 
				ifFalse: [ stream nextPutAll: '*' ]
		]
	]