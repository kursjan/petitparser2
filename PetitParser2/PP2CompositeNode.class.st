"
A PPCompositeParser is composed parser built from various primitive parsers. 

Every production in the receiver is specified as a method that returns its parser. Note that every production requires an instance variable of the same name, otherwise the production is not cached and cannot be used in recursive grammars. Productions should refer to each other by reading the respective inst-var. Note: these inst-vars are typically not written, as the assignment happens in the initialize method using reflection.

The start production is defined in the method start. It is aliased to the inst-var parser defined in the superclass of PPCompositeParser.
"
Class {
	#name : #PP2CompositeNode,
	#superclass : #PP2DelegateNode,
	#category : 'PetitParser2-Tools'
}

{ #category : #accessing }
PP2CompositeNode class >> ignoredNames [
	"Answer a collection of instance-variables that should not be automatically initialized with productions, but that are used internal to the composite parser."

	^ PP2CompositeNode allInstVarNames
]

{ #category : #'instance creation' }
PP2CompositeNode class >> new [
	"Answer a new parser starting at the default start symbol."

	^ self newStartingAt: self startSymbol
]

{ #category : #'instance creation' }
PP2CompositeNode class >> newStartingAt: aSymbol [
	"Answer a new parser starting at aSymbol."
	^ self basicNew
		initializeStartingAt: aSymbol;
		yourself
]

{ #category : #parsing }
PP2CompositeNode class >> parse: anObject [
	^ self parse: anObject startingAt: self startSymbol
]

{ #category : #parsing }
PP2CompositeNode class >> parse: anObject onError: aBlock [
	^ self parse: anObject startingAt: self startSymbol onError: aBlock
]

{ #category : #parsing }
PP2CompositeNode class >> parse: anObject startingAt: aSymbol [
	^ (self newStartingAt: aSymbol) parse: anObject
]

{ #category : #parsing }
PP2CompositeNode class >> parse: anObject startingAt: aSymbol onError: aBlock [
	^ (self newStartingAt: aSymbol) parse: anObject onError: aBlock
]

{ #category : #accessing }
PP2CompositeNode class >> startSymbol [
	"Answer the method that represents the default start symbol."

	^ #start
]

{ #category : #visiting }
PP2CompositeNode >> accept: visitor [
	^ visitor visitComposite: self
]

{ #category : #initialization }
PP2CompositeNode >> initializeStartingAt: aSymbol [
	| parser |
	self initialize.

	self productionNames keysAndValuesDo: [ :key :value |
		self instVarAt: key put: (PP2DelegateNode named: value) 
	].

	self productionNames keysAndValuesDo: [ :key :value |
		parser := self perform: value.
		self assert: parser ~= self description: 'you probably forgot to return the parser in "', value, '"'.
		(self instVarAt: key) child: parser 
	].

	child := (self perform: aSymbol)
]

{ #category : #testing }
PP2CompositeNode >> isProduction [
	^ false
]

{ #category : #querying }
PP2CompositeNode >> productionAt: aSymbol [
	"Answer the production named aSymbol."
	
	^ self productionAt: aSymbol ifAbsent: [ nil ]
]

{ #category : #querying }
PP2CompositeNode >> productionAt: aSymbol ifAbsent: aBlock [
	"Answer the production named aSymbol, if there is no such production answer the result of evaluating aBlock."
	
	(self class ignoredNames includes: aSymbol asString)
		ifTrue: [ ^ aBlock value ].
	(self class startSymbol = aSymbol)
		ifTrue: [ ^ child ].
	^ self instVarAt: (self class allInstVarNames
		indexOf: aSymbol asString
		ifAbsent: [ ^ aBlock value ])
]

{ #category : #querying }
PP2CompositeNode >> productionNames [
	"Answer a dictionary of slot indexes and production names."
	
	| productionNames ignoredNames |
	productionNames := Dictionary new.
	ignoredNames := self class ignoredNames
		collect: [ :each | each asSymbol ].
	self class allInstVarNames keysAndValuesDo: [ :key :value |
		(ignoredNames includes: value asSymbol)
			ifFalse: [ productionNames at: key put: value asSymbol ] ].
	^ productionNames
]

{ #category : #accessing }
PP2CompositeNode >> start [
	"Answer the production to start this parser with."
	
	self subclassResponsibility
]
