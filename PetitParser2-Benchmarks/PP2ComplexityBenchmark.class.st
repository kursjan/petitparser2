Class {
	#name : #PP2ComplexityBenchmark,
	#superclass : #PP2Benchmark,
	#category : 'PetitParser2-Benchmarks-Core'
}

{ #category : #initialization }
PP2ComplexityBenchmark >> initialize [
	super initialize.
	
	sourcesSize := 'Complexity'.
]

{ #category : #reporting }
PP2ComplexityBenchmark >> reportInput: anInput time: time gcTime: gcTime name: nameOrNil [
	| size name |
	size := anInput size.
	
	name := nameOrNil isNil 
		ifTrue: [ parser class printString ]
		ifFalse: [ nameOrNil ].
	
	report addEntry: name size: size time: time gcTime: gcTime.
]

{ #category : #running }
PP2ComplexityBenchmark >> run [
	^ self runTimeout: 30 asDuration
]

{ #category : #running }
PP2ComplexityBenchmark >> runTimeout: timeout [
	| time |

	self repetitions timesRepeat: [ 
		
		input withIndexDo: [ :source :index | 
			time := [[ parser parse: source withContext: self context ]
				valueWithin: timeout
				onTimeout: [ Transcript cr; show: 'timeout'; cr. #TIMEOUT ] ] timeToRunWithoutGC.
			self reportInput: source time: time name: parser name.
		].

	].

	^ report
]
