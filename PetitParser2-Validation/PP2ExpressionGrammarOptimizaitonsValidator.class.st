Class {
	#name : #PP2ExpressionGrammarOptimizaitonsValidator,
	#superclass : #PP2Validator,
	#instVars : [
		'parser',
		'optimizedParser'
	],
	#category : 'PetitParser2-Validation-Optimizations'
}

{ #category : #validation }
PP2ExpressionGrammarOptimizaitonsValidator >> actualForSource: source [
	| result |
	result := optimizedParser parse: source.
	^ result isPetit2Failure ifFalse: [ 
		result value
	] ifTrue: [ 
		#failure
	]
]

{ #category : #validation }
PP2ExpressionGrammarOptimizaitonsValidator >> expectedForSource: source [
	| result |
	result := parser parse: source.
	
	^ result isPetit2Failure ifFalse: [ 
		result value
	] ifTrue: [ 
		#failure
	]
]

{ #category : #initialization }
PP2ExpressionGrammarOptimizaitonsValidator >> initialize [
	super initialize.
	
	parser := PP2ExpressionGrammar new.
	optimizedParser := PP2ExpressionGrammar new optimize
]

{ #category : #accessing }
PP2ExpressionGrammarOptimizaitonsValidator >> name [
	^ 'PP2ExpressionGrammar(Opt)'
]

{ #category : #accessing }
PP2ExpressionGrammarOptimizaitonsValidator >> optimizedParser [
	^ optimizedParser
]

{ #category : #accessing }
PP2ExpressionGrammarOptimizaitonsValidator >> parser [
	^ parser
]

{ #category : #accessing }
PP2ExpressionGrammarOptimizaitonsValidator >> sources [
	^ PP2Sources current inputs: #expressionOfSize: steps: 200 amount: 1 max: 200
]
