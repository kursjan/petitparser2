*PetitParser2-GUI
debugResult
	| context |
	context := stream asPetit2Stream reset asPetit2Context. 
	context position: start.
	context parser: parser.
	context parser enableDebug parseWithContext: context.
	
	^ context debugResult 