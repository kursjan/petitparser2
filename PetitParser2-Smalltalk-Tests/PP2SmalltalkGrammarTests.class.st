Class {
	#name : #PP2SmalltalkGrammarTests,
	#superclass : #PP2CompositeNodeTest,
	#traits : 'TPP2SmalltalkGrammarTests',
	#classTraits : 'TPP2SmalltalkGrammarTests classTrait',
	#category : 'PetitParser2-Smalltalk-Tests-Core'
}

{ #category : #accessing }
PP2SmalltalkGrammarTests class >> shouldInheritSelectors [
	^ true
]

{ #category : #parsing }
PP2SmalltalkGrammarTests >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parse: aStream withContext: aContext
]

{ #category : #testing }
PP2SmalltalkGrammarTests >> testCompleteness [
	"This test asserts that all subclasses override all test methods."
	
	| subclasses |
	subclasses := self class allSubclasses.
	
	subclasses := (subclasses reject: [:subclass | subclass name endsWith: '_Optimized' ]).
	subclasses := (subclasses reject: [:subclass | subclass name endsWith: '_Direct' ]).
	subclasses := (subclasses reject: [:subclass | subclass name endsWith: '_InMemoryCtx' ]).
	subclasses do: [ :subclass |
		self class testSelectors do: [ :selector |
			self 
				assert: (selector = #testCompleteness or: [ subclass selectors includes: selector ])
				description: subclass printString , ' does not test ' , selector printString ] ]
]
