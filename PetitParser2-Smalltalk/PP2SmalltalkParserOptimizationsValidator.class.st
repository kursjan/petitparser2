Class {
	#name : #PP2SmalltalkParserOptimizationsValidator,
	#superclass : #PP2Validator,
	#instVars : [
		'parser',
		'optimizedParser'
	],
	#category : 'PetitParser2-Smalltalk-Validation'
}

{ #category : #validation }
PP2SmalltalkParserOptimizationsValidator >> actualForSource: source [
	| result |
	result := optimizedParser parse: source.
	^ result isPetit2Failure ifFalse: [ 
		Array with: result value
	] ifTrue: [ 
		#failure
	]
]

{ #category : #validation }
PP2SmalltalkParserOptimizationsValidator >> expectedForSource: source [
	| result |
	result := parser parse: source.
	
	^ result isPetit2Failure ifFalse: [ 
		Array with: result value
	] ifTrue: [ 
		#failure
	]
]

{ #category : #initialization }
PP2SmalltalkParserOptimizationsValidator >> initialize [
	super initialize.
	
	parser := PP2SmalltalkParser new.
	optimizedParser := PP2SmalltalkParser new optimize
]

{ #category : #accessing }
PP2SmalltalkParserOptimizationsValidator >> name [
	^ 'PP2SmalltalkParser(Opt)'
]

{ #category : #accessing }
PP2SmalltalkParserOptimizationsValidator >> sources [
	^ PP2Sources current smalltalkSourcesVerification
]
