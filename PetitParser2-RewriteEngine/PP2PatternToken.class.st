Class {
	#name : #PP2PatternToken,
	#superclass : #Object,
	#instVars : [
		'collection',
		'start',
		'stop',
		'parent',
		'testBlock',
		'name'
	],
	#category : 'PetitParser2-RewriteEngine-Core'
}

{ #category : #'instance creation' }
PP2PatternToken class >> on: collection start: start stop: stop [
	^ self new
		collection: collection;
		start: start;
		stop: stop;
		yourself
]

{ #category : #comparing }
PP2PatternToken >> = aSmaCCToken [
	^ self class = aSmaCCToken class
		and: [ self name = aSmaCCToken name ]
]

{ #category : #accessing }
PP2PatternToken >> children [
	^ OrderedCollection with: self
]

{ #category : #accessing }
PP2PatternToken >> collection [
	^ collection
]

{ #category : #accessing }
PP2PatternToken >> collection: anObject [
	collection := anObject
]

{ #category : #comparing }
PP2PatternToken >> hash [
	^ self class hash bitXor: self name hash
]

{ #category : #testing }
PP2PatternToken >> isParseNode [
	^ false
]

{ #category : #testing }
PP2PatternToken >> isParseToken [
	^ true
]

{ #category : #testing }
PP2PatternToken >> isToken [
	^ true
]

{ #category : #matching }
PP2PatternToken >> match: parseNode inContext: aDictionary [
	^ parseNode isToken
		and: [ (aDictionary at: self ifAbsentPut: [ parseNode ]) = parseNode
				and: [ self testBlock value: parseNode ] ]
]

{ #category : #accessing }
PP2PatternToken >> name [
	self assert: name notNil.
	
	^ name	
]

{ #category : #accessing }
PP2PatternToken >> name: aString [
	name := aString
]

{ #category : #accessing }
PP2PatternToken >> parent [
	^ parent
]

{ #category : #accessing }
PP2PatternToken >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
PP2PatternToken >> printOn: aStream [
	(collection copyFrom: start to: stop) printOn: aStream.
	aStream nextPut: $[.
	start printOn: aStream.
	aStream nextPut: $,.
	stop printOn: aStream.
	aStream nextPut: $].
]

{ #category : #accessing }
PP2PatternToken >> start [
	^ start
]

{ #category : #accessing }
PP2PatternToken >> start: anObject [
	start := anObject
]

{ #category : #accessing }
PP2PatternToken >> stop [
	^ stop
]

{ #category : #accessing }
PP2PatternToken >> stop: anObject [
	stop := anObject
]

{ #category : #accessing }
PP2PatternToken >> testBlock [
	^ testBlock ifNil: [ [ :arg | true ] ]
]

{ #category : #accessing }
PP2PatternToken >> testBlock: aBlock [
	testBlock := aBlock
]

{ #category : #accessing }
PP2PatternToken >> value [
	self halt: 'deprecated?'.
	^ collection copyFrom: start to: stop
]
