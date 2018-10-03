Class {
	#name : #PP2ManifestMfParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'pairs',
		'pair',
		'label',
		'basicValue',
		'oneLinerBasicValue',
		'pairValue',
		'newline',
		'valueSeparator'
	],
	#category : 'PetitParser2-ManifestMf'
}

{ #category : #'as yet unclassified' }
PP2ManifestMfParser >> basicValue [
	^ oneLinerBasicValue , ((newline , #space asPParser) , oneLinerBasicValue ==> #last) star
	
	==> [:token | 
		((OrderedCollection with: token first inspect) addAll: token second; yourself) asArray ]
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParser >> label [
	^ (#letter asPParser / #digit asPParser / $- asPParser) star flatten trim
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParser >> newline [
	^ (Character lf asPParser)
	/ (Character cr asPParser , Character lf asPParser optional)
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParser >> oneLinerBasicValue [
	^ (PP2PredicateObjectNode noneOf: {$, . Character cr . Character lf })
		star flatten
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParser >> pair [
	^label , $: asPParser token trim, pairValue ==> [:token | (token at: 1)->(token at: 3)]
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParser >> pairValue [
	^ oneLinerBasicValue , ((valueSeparator , oneLinerBasicValue) ==> [:token | token last] ) star
	
	==> [:token | 
		((OrderedCollection with: token first) addAll: token last; yourself) asArray ]
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParser >> pairs [
	^ pair , (newline , pair ==> [:token | token second ]) star, newline star
	
	==> [:token | 
		((OrderedCollection with: token first) addAll: token second; yourself) asArray ]
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParser >> start [
	^ pairs end 
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParser >> valueSeparator [
	^ $, asPParser token trim
]
