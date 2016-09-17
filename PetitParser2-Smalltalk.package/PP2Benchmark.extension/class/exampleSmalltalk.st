*PetitParser2-Smalltalk
exampleSmalltalk
	<example>
	
	| b |
	Metacello new
  		baseline: 'SmaCC';
		repository: 'github://ThierryGoubier/SmaCC:v2.0.5';
 		load: 'SmaCC-Smalltalk-Parser'.

	b := PP2Benchmark new.
	b benchmarkSmalltalkParser.
	b benchmarkSmalltalkParserNoOpt.
	b benchmarkSmalltalkParserSmacc.
	b benchmarkRBParser.
	b showTpcs inspect