examples
exampleExpressionGrammar
	<example>
	
	| b |
	b := PP2Benchmark new.
	b benchmarkExpressionGrammar.
	b benchmarkExpressionGrammarNoOpt.
	b showTpcs inspect