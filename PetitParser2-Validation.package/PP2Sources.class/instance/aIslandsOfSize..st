seas
aIslandsOfSize: size
	| collection |
	collection := String new: size.
	
	1 to: size do: [ :index |
		(10 atRandom == 1) ifTrue: [ 
			collection at: index put: $a.
		] ifFalse: [ 
	 		collection at: index put: $. .	
		]
	].
	^ collection