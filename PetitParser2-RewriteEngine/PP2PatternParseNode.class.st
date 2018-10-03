Class {
	#name : #PP2PatternParseNode,
	#superclass : #Object,
	#instVars : [
		'children',
		'completeSource',
		'patternToken',
		'parent',
		'name'
	],
	#category : 'PetitParser2-RewriteEngine-Core'
}

{ #category : #comparing }
PP2PatternParseNode >> = anObject [
	(self == anObject) ifTrue: [ ^ true ].
	
	^ (self class = anObject class) and: [ self patternToken = anObject patternToken ]
]

{ #category : #accessing }
PP2PatternParseNode >> children [
	^ children
]

{ #category : #accessing }
PP2PatternParseNode >> completeSource [
	^ completeSource 
]

{ #category : #accessing }
PP2PatternParseNode >> completeSource: source [
	completeSource := source
]

{ #category : #comparing }
PP2PatternParseNode >> hash [
	^ self patternToken hash
]

{ #category : #testing }
PP2PatternParseNode >> isParseNode [
	^ true
]

{ #category : #testing }
PP2PatternParseNode >> isPatternParseNode [
	^ true
]

{ #category : #matching }
PP2PatternParseNode >> match: otherParseNode inContext: aDictionary [
    | parseNode |
    parseNode := aDictionary at: self ifAbsentPut: [ otherParseNode ].
	"
		JK: I have no idea if matching by source is a good idea or not. SmaCC doe not do this.
		PP2 does, because we want PP2ExpressionGramamr to work. E.g. `primary ('12')` should 
		match `terms ( primary ('12') )`: they both parse the same input, though the parse tree
		is different.
	"
    ^ (otherParseNode = parseNode or: [ otherParseNode source = parseNode source ])
        and: [ patternToken testBlock value: parseNode ]
]

{ #category : #accessing }
PP2PatternParseNode >> name [
	^ patternToken name
]

{ #category : #accessing }
PP2PatternParseNode >> name: anObject [
	name := anObject
]

{ #category : #accessing }
PP2PatternParseNode >> parent [
	^ parent
]

{ #category : #accessing }
PP2PatternParseNode >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
PP2PatternParseNode >> patternToken [
	^ patternToken
]

{ #category : #accessing }
PP2PatternParseNode >> patternToken: token [
	self assert: patternToken isNil.
	
	children := OrderedCollection  with: token.
	patternToken := token
]

{ #category : #printing }
PP2PatternParseNode >> printOn: aStream [
	super printOn: aStream.
	
	name isNil ifFalse: [ 
		aStream nextPut: $(.
		patternToken printOn: aStream.
		aStream nextPut: $).
	]
]
