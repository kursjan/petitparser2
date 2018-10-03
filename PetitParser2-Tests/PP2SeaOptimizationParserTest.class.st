Class {
	#name : #PP2SeaOptimizationParserTest,
	#superclass : #PP2AbstractParserTest,
	#traits : 'TPP2SeaParserTest',
	#classTraits : 'TPP2SeaParserTest classTrait',
	#instVars : [
		'result'
	],
	#category : 'PetitParser2-Tests-Seas'
}

{ #category : #'parse support' }
PP2SeaOptimizationParserTest >> assert: parser parse: input [
	parser optimize.
	result := (super assert: parser parse: input) value
]

{ #category : #parsing }
PP2SeaOptimizationParserTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parseAdaptable: aStream withContext: aContext
]

{ #category : #'parse support' }
PP2SeaOptimizationParserTest >> result [
	^ result
]

{ #category : #'parse support' }
PP2SeaOptimizationParserTest >> seaInstance [
	^ PP2SeaNode new
]
