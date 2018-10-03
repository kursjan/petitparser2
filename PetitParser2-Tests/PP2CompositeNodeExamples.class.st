"
I am an abstract class that should be used for writing examples about parsers, using GToolkit-Examples.

I am supposed to be subclassed in a similar fashion as PP2CompositeNodeTest.
"
Class {
	#name : #PP2CompositeNodeExamples,
	#superclass : #Object,
	#instVars : [
		'result',
		'parserInstance'
	],
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #utilities }
PP2CompositeNodeExamples >> assert: aCollection is: anObject [
	self parse: aCollection.
	self
		assert: result = anObject
		description: 'Got: ' , result printString , '; Expected: ' , anObject printString
		resumable: true
]

{ #category : #context }
PP2CompositeNodeExamples >> context [
	^ PP2Context new
]

{ #category : #parsing }
PP2CompositeNodeExamples >> fail: aString rule: aSymbol [ 
	| production context |
	production := self parserInstanceFor: aSymbol.
	context := self context.
	
	result := production parse: aString withContext: context.
	
	self
		assert: (result isPetit2Failure or: [context atEnd not])
		description: 'Able to parse ' , aString printString.
	^ result
]

{ #category : #accessing }
PP2CompositeNodeExamples >> parse: aString [ 
	^ self parse: aString rule: #start
]

{ #category : #accessing }
PP2CompositeNodeExamples >> parse: aString production: production to: expectedResult end: end checkResult: aBoolean [
	| ctx resultContext result |
	ctx := self context.
	resultContext := self parse: aString withParser: production withContext: ctx.
	result := resultContext value.
	
	self
		assert: resultContext isPetit2Failure not
		description: 'Unable to parse ' , aString printString.
	
	self assert: resultContext position equals: end.
	aBoolean ifTrue: [ self assert: expectedResult equals: result ].
	^ result
]

{ #category : #accessing }
PP2CompositeNodeExamples >> parse: aString rule: aSymbol [
	^ self parse: aString rule: aSymbol end: aString size
]

{ #category : #accessing }
PP2CompositeNodeExamples >> parse: aString rule: aSymbol end: end [
	^ self parse: aString rule: aSymbol to: nil end: end checkResult: false
]

{ #category : #accessing }
PP2CompositeNodeExamples >> parse: aString rule: aSymbol to: expectedResult end: end checkResult: aBoolean [
	| production |
	production := self parserInstanceFor: aSymbol.
	^ self parse: aString production: production to: expectedResult end: end checkResult: aBoolean 	
]

{ #category : #accessing }
PP2CompositeNodeExamples >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parse: aStream withContext: aContext
]

{ #category : #accessing }
PP2CompositeNodeExamples >> parserClass [
	self subclassResponsibility
]

{ #category : #accessing }
PP2CompositeNodeExamples >> parserInstance [
	^ parserInstance ifNil: [ parserInstance := self parserClass new ]
]

{ #category : #accessing }
PP2CompositeNodeExamples >> parserInstanceFor: aSymbol [
	^ aSymbol = #start
		ifTrue: [ self parserInstance ]
		ifFalse: [
			self parserInstance
				productionAt: aSymbol 
				ifAbsent: [ self error: 'Production ' , self parserClass name , '>>' , aSymbol printString , ' not found.' ] ]
]
