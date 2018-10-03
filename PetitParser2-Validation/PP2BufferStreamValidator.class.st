Class {
	#name : #PP2BufferStreamValidator,
	#superclass : #PP2Validator,
	#instVars : [
		'parser'
	],
	#category : 'PetitParser2-Validation-Streams'
}

{ #category : #validation }
PP2BufferStreamValidator >> actualForSource: source [
	| result |
	
	[
		result := parser parse: (PP2BufferStream on: (PP2MinimalStream on: source) bufferSize: 64).
	] on: SubscriptOutOfBounds do: [  
		(PP2SkipValidation reason: 'To small buffer') signal
	].

	^ result isPetit2Failure ifFalse: [ 
		result value isCollection 
			ifTrue: [  result value ] 
			ifFalse: [ Array with: result value ]
	] ifTrue: [ 
		#failure
	]
]

{ #category : #validation }
PP2BufferStreamValidator >> expectedForSource: source [
	| result |
	result := parser parse: source.
	
	^ result isPetit2Failure ifFalse: [ 
		result value isCollection 
			ifTrue: [  result value ] 
			ifFalse: [ Array with: result value ]
	] ifTrue: [ 
		#failure
	]
]

{ #category : #initialization }
PP2BufferStreamValidator >> initialize [
	super initialize.
	
	parser := PP2ExpressionParser new
]

{ #category : #accessing }
PP2BufferStreamValidator >> name [
	^ 'PP2BufferStream'
]

{ #category : #accessing }
PP2BufferStreamValidator >> sources [
	^ PP2Sources current inputs: #expressionOfSize: steps: 200 amount: 1 max: 200
]
