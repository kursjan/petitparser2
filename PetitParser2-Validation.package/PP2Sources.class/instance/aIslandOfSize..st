seas
aIslandOfSize: size
	| collection |
	collection := String new: size.
	
	1 to: size do: [ :index |
	 		collection at: index put: $. .	
	].

	collection at: size atRandom put: $a.
	^ collection