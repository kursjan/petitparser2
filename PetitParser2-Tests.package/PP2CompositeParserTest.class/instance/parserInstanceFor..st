accessing
parserInstanceFor: aSymbol
	^ aSymbol = #start
		ifTrue: [ self parserInstance ]
		ifFalse: [
			self parserInstance
				productionAt: aSymbol 
				ifAbsent: [ self error: 'Production ' , self parserClass name , '>>' , aSymbol printString , ' not found.' ] ]