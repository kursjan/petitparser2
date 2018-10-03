Class {
	#name : #'PP2WebPageParserTest_Optimized',
	#superclass : #PP2WebPageGrammarTest,
	#traits : 'TPP2WebPageParserTest',
	#classTraits : 'TPP2WebPageParserTest classTrait',
	#category : 'PetitParser2-Html-Tests-Core'
}

{ #category : #accessing }
PP2WebPageParserTest_Optimized >> parserClass [
	^ PP2WebPageParser 
]

{ #category : #accessing }
PP2WebPageParserTest_Optimized >> parserInstanceFor: aSymbol [
	^ (super parserInstanceFor: aSymbol) optimize;
		resetCaches;
		yourself
]

{ #category : #accessing }
PP2WebPageParserTest_Optimized >> result [
	^ result
]

{ #category : #accessing }
PP2WebPageParserTest_Optimized >> scripts: rootElement [
	^ rootElement allElements select: [ :e | e isKindOf: PP2JavascriptElement  ]
]
