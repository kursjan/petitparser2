*PetitParser2-Smalltalk
setupSmalltalkParserSmacc
	"
		Metacello new
		  	baseline: 'SmaCC';
  			repository: 'github://ThierryGoubier/SmaCC:v2.0.5';
  			load: 'SmaCC-Smalltalk-Parser'
	"
	
	
	input := self sourcesFor: 'smalltalk'.
	parser := Smalltalk at: #StParser.
	preferredRepetitions := 3.