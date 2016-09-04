*PetitParser2-GUI
debugResult
	| context |
	debugResult isNil ifTrue: [ 
		input ifNil: [ ^ nil ].
		root ifNil: [ ^ nil ].
	
		context := input asPetit2Stream reset asPetit2Context.
		root enableDebug parseAdaptableWithContext: context.
		debugResult := context debugResult
	].
	^ debugResult