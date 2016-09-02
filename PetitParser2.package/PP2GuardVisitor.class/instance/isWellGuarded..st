testing
isWellGuarded: classification
	| topClassification |
	topClassification := guarded top.

	topClassification with: classification do: [ :topC :localC |
		localC ifTrue: [ self assert: topC ].

		"is single change enough?"		
		(topC and: localC not) ifTrue: [ ^ false ].	
	].

	^ true
	"
		(DiffMorph 
		from: (topClassification joinUsing: Character lf) 
		to: (classification joinUsing: Character lf)) openInWindow
	"