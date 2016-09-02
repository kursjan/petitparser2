testing
isWellGuarded: classification
	| topClassification changes |
	topClassification := guarded top.
	changes := 0.
	
	topClassification with: classification do: [ :topC :localC |
		localC ifTrue: [ self assert: topC ].

		"is single change enough?"		
		(topC and: localC not) ifTrue: [  
			changes := changes + 1.
		].	
	].


	^ changes == 0
	"
		(DiffMorph 
		from: (topClassification joinUsing: Character lf) 
		to: (classification joinUsing: Character lf)) openInWindow
	"