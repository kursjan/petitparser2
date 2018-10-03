Extension { #name : #PP2Benchmark }

{ #category : #'*PetitParser2-Experiments-Interpret' }
PP2Benchmark >> benchmarkSmalltalkGrammarIM [
	"IM: Interpreted with Mutable context"
	self smartSetupAndRun: thisContext method selector.
]

{ #category : #'*PetitParser2-Experiments-Interpret' }
PP2Benchmark >> setupSmalltalkGrammarIM [
	"IM: Interpreted with Mutable context"
	
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (IM)'.
	
	contextClass := PP2Context.
	selector := #'parseInterpreted:withContext:'.
	preferredRepetitions := 3.
]
