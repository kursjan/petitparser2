Class {
	#name : #PP2CompositeNodeTest,
	#superclass : #PP2AbstractParserTest,
	#instVars : [
		'result',
		'parser',
		'resultContext'
	],
	#category : #'PetitParser2-Tests-Core'
}

{ #category : #testing }
PP2CompositeNodeTest class >> isAbstract [
	^ self name = #PP2CompositeNodeTest
]

{ #category : #accessing }
PP2CompositeNodeTest class >> resources [
	^ Array with: PP2ParserResource
]

{ #category : #utilities }
PP2CompositeNodeTest >> assert: aCollection is: anObject [
	self parse: aCollection.
	self
		assert: result = anObject
		description: 'Got: ' , result printString , '; Expected: ' , anObject printString
		resumable: true
]

{ #category : #parsing }
PP2CompositeNodeTest >> fail: aString production: production to: expectedFailureResult end: expectedFailurePosition checkResult: aBoolean [ 
	| context |
	context := self context.
	resultContext := self	parse: aString withParser: production withContext: context.
	result := resultContext value.
	resultContext isPetit2Failure
		ifTrue: [ self assert: expectedFailureResult isPetit2Failure.
    		expectedFailureResult message ifNotNil: [ self assert: expectedFailureResult message equals: result message ] ]
		ifFalse: [ aBoolean
				ifTrue: [ self assert: expectedFailureResult equals: result ]
    ].
	aBoolean
		ifTrue: [ self assert: resultContext position equals: expectedFailurePosition ].
	^ result
]

{ #category : #parsing }
PP2CompositeNodeTest >> fail: aString rule: aSymbol [ 
	| context |
	context := self context.
	^ self fail: aString rule: aSymbol end: context position
]

{ #category : #parsing }
PP2CompositeNodeTest >> fail: aString rule: aSymbol end: end [ 
	^ self fail: aString rule: aSymbol to: PP2Failure new end: end checkResult: false
]

{ #category : #parsing }
PP2CompositeNodeTest >> fail: aString rule: aSymbol to: expectedResult [ 
	^ self fail: aString rule: aSymbol to: expectedResult end: expectedResult position checkResult: true
]

{ #category : #parsing }
PP2CompositeNodeTest >> fail: aString rule: aSymbol to: expectedResult end: expectedFailurePosition [ 
	^ self fail: aString rule: aSymbol to: expectedResult end: expectedFailurePosition checkResult: true
]

{ #category : #parsing }
PP2CompositeNodeTest >> fail: aString rule: aSymbol to: expectedResult end: expectedFailurePosition checkResult: aBoolean [ 
	| production |
	production := self parserInstanceFor: aSymbol.
  ^ self fail: aString rule: aSymbol to: expectedResult end: expectedFailurePosition checkResult: aBoolean
]

{ #category : #parsing }
PP2CompositeNodeTest >> parse: aString [ 
	^ self parse: aString rule: #start
]

{ #category : #parsing }
PP2CompositeNodeTest >> parse: aString production: production to: expectedResult end: end checkResult: aBoolean [
	| ctx |
	ctx := self context.
	resultContext := self parse: aString withParser: production withContext: ctx.
	result := resultContext value.
	
	self
		deny: resultContext isPetit2Failure
		description: 'Unable to parse ' , aString printString.
	
	self assert: resultContext position equals: end.
	aBoolean ifTrue: [ self assert: expectedResult equals: result ].
	^ result
]

{ #category : #parsing }
PP2CompositeNodeTest >> parse: aString rule: aSymbol [
	^ self parse: aString rule: aSymbol end: aString size
]

{ #category : #parsing }
PP2CompositeNodeTest >> parse: aString rule: aSymbol end: end [
	^ self parse: aString rule: aSymbol to: nil end: end checkResult: false
]

{ #category : #parsing }
PP2CompositeNodeTest >> parse: aString rule: aSymbol to: expectedResult [
	^ self parse: aString rule: aSymbol to: expectedResult end: aString size checkResult: true
]

{ #category : #parsing }
PP2CompositeNodeTest >> parse: aString rule: aSymbol to: expectedResult end: end [
	^ self parse: aString rule: aSymbol  to:  expectedResult  end: end checkResult:  true
]

{ #category : #parsing }
PP2CompositeNodeTest >> parse: aString rule: aSymbol to: expectedResult end: end checkResult: aBoolean [
	| production |
	production := self parserInstanceFor: aSymbol.
	^ self parse: aString production: production to: expectedResult end: end checkResult: aBoolean 	
]

{ #category : #accessing }
PP2CompositeNodeTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parse: aStream withContext: aContext
]

{ #category : #accessing }
PP2CompositeNodeTest >> parserClass [
	self subclassResponsibility
]

{ #category : #accessing }
PP2CompositeNodeTest >> parserInstance [
	^ PP2ParserResource current parserAt: self parserClass
]

{ #category : #accessing }
PP2CompositeNodeTest >> parserInstanceFor: aSymbol [
	^ aSymbol = #start
		ifTrue: [ self parserInstance ]
		ifFalse: [
			self parserInstance
				productionAt: aSymbol 
				ifAbsent: [ self error: 'Production ' , self parserClass name , '>>' , aSymbol printString , ' not found.' ] ]
]

{ #category : #running }
PP2CompositeNodeTest >> setUp [
	super setUp.
	parser := self parserInstance
]

{ #category : #running }
PP2CompositeNodeTest >> tearDown [
	super tearDown.
	parser := result := nil
]
