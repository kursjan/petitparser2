*PetitParser2-GUI
debugResult
	| context |
	debugResult isNil ifTrue: [ 
		input ifNil: [ ^ nil ].
		parser ifNil: [ ^ nil ].
	
		context := input asPetit2Stream reset asPetit2Context.
		parser enableDebug parseWithContext: context.
		debugResult := context debugResult
	].
	^ debugResult