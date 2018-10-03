Class {
	#name : #PP2SeaParserTest,
	#superclass : #PP2AbstractParserTest,
	#traits : 'TPP2SeaParserTest',
	#classTraits : 'TPP2SeaParserTest classTrait',
	#instVars : [
		'result'
	],
	#category : 'PetitParser2-Tests-Seas'
}

{ #category : #utilities }
PP2SeaParserTest >> assert: parser parse: input [
	result := (super assert: parser parse: input) value
]

{ #category : #accessing }
PP2SeaParserTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parseAdaptable: aStream withContext: aContext
]

{ #category : #'parse support' }
PP2SeaParserTest >> result [
	^ result
]

{ #category : #'parse support' }
PP2SeaParserTest >> seaInstance [
	^ PP2SeaNode new
]

{ #category : #tests }
PP2SeaParserTest >> testNestedBlockDeepNested [
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{ {} { {  } } }'.
	self assert: self result size equals: 3.
	self assert: self result first equals: ${.
	self assert: self result second size equals: 2.
	self assert: self result second first size equals: 3.
	self assert: self result second second size equals: 3.
	self assert: self result third equals: $}.
]
