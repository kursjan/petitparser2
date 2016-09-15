transforming
nameNewMethod: aSymbol 
	class addInstanceVariable: aSymbol asString.
	extractedParseTree renameSelector: aSymbol andArguments: #().
	modifiedParseTree := RBParseTreeRewriter 
		replace: self methodDelimiter
		with: aSymbol asString
		in: modifiedParseTree