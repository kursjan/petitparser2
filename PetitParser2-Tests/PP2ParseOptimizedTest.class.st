Class {
	#name : 'PP2ParseOptimizedTest',
	#superclass : 'PP2AbstractParserTest',
	#traits : 'TPP2ParseTest - {#testEndOfInput2}',
	#classTraits : 'TPP2ParseTest classTrait',
	#instVars : [
		'context'
	],
	#category : 'PetitParser2-Tests-Parsing',
	#package : 'PetitParser2-Tests',
	#tag : 'Parsing'
}

{ #category : 'parsing' }
PP2ParseOptimizedTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser optimize parseAdaptable: aStream withContext: aContext
]
