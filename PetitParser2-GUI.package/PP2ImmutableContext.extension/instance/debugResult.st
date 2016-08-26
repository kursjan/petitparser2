*PetitParser2-GUI
debugResult
	startContext isNil ifTrue: [ 
 		^ nil	
	].

	^ (PP2DebuggingInterpret on: startContext parser)
		parse: startContext stream